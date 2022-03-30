// --------------------------------------------------------------------
// <copyright file="TankBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Runtime.CompilerServices;
    using SmartAquaponic.Common.Execptions;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Common.Strategy;
    using SmartAquaponic.DataAccess.Mappers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;

    /// <summary>
    /// TankBll.
    /// </summary>
    public class TankBll : ShapeStrategy, ICrud<Tank>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly TankDal mapper;
        private decimal temperatureDifference = 5;
        private decimal pHDifference = 3;

        /// <summary>
        /// Initializes a new instance of the <see cref="TankBll"/> class.
        /// </summary>
        public TankBll()
        {
            this.mapper = new TankDal();
        }

        public TankBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new TankDal();
        }

        /// <inheritdoc/>
        public int Create(Tank entity)
        {
            this.ValidateEnviroment(entity);
            
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Tank {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Tank entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Tank {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Tank Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Tank> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Tank entity)
        {
            this.ValidateEnviroment(entity);

            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"Tank {id} updated.");
            }

            return id;
        }

        private void LogMessage(string message)
        {
            var log = new Log()
            {
                Event = EventType.Info,
                Ip = this.ip,
                Message = message,
                User = this.currentUser,
            };

            new LogBll().Create(log);
        }

        private void ValidateEnviroment(Tank tank)
        {
            this.ValidateFishComunity(tank);
            this.ValidateSpace(tank);
            this.ValidateTemp(tank);
            this.ValidatePh(tank);
        }

        /// <summary>
        /// A fish support +- 3PH.
        /// </summary>
        private void ValidatePh(Tank tank)
        {
            foreach (var fish in tank.Fishes)
            {
                if (!((int)tank.Ph >= (int)fish.Ph - this.pHDifference && (int)tank.Ph <= (int)fish.Ph + this.pHDifference))
                {
                    throw new TankException($"Water PH is not compatible with the fish: {fish.Name}.", "-5000");
                }
            }
        }

        /// <summary>
        /// A fish support +- 5C.
        /// </summary>
        private void ValidateTemp(Tank tank)
        {
            foreach (var fish in tank.Fishes)
            {
                if (!(tank.WaterTemp >= fish.Temp - this.temperatureDifference && tank.WaterTemp <= fish.Temp + this.temperatureDifference))
                {
                    throw new TankException($"Water temperature is not compatible with the fish: {fish.Name}.", "-5000");
                }
            }
        }

        /// <summary>
        /// Tank space and total supported fishes.
        /// </summary>
        private void ValidateSpace(Tank tank)
        {
            var tankVolume = this.GetVolume(tank.Heigth, tank.Length, tank.Width);
            var contextVolume = tank.Decors.Sum(x => x.Volume) + tank.WaterPump.Volume;
            var fishVolume = tank.Fishes.Sum(x => x.WaterRequired);

            if ((tankVolume - contextVolume - fishVolume) < 0 )
            {
                throw new TankException($"There is not space for decors or fishes.", "-5000");
            }
        }

        /// <summary>
        /// Validate fishes in the context.
        /// </summary>
        private void ValidateFishComunity(Tank tank)
        {
            foreach (var fish in tank.Fishes)
            {
                // check fish relationship
                if (fish.IsLonely)
                {
                    if (tank.Fishes.Count(x => x.Id.Equals(fish.Id)) > 1)
                    {
                        throw new TankException($"{fish.Name} cannot be with another of the same species.", "-5000");
                    }
                }

                // check prey and predator
                var predators = fish.Predators.Where(x => tank.Fishes.Any(y => y.Id == x.Id)).ToList();

                //var predators = fish.Predators.Intersect(tank.Fishes).ToList();
                if (predators.Any())
                {
                    throw new TankException($"{fish.Name} is prey by a predator: {predators[0].Name}.", "-5000");
                }
            }
        }

        public override decimal GetVolume(decimal heigth, decimal length, decimal width)
        {
            decimal result = base.GetVolume(heigth, length, width);

            return result - (result * 20 / 100);
        }
    }
}
