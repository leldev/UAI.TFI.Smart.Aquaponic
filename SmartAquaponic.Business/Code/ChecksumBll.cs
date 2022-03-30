// --------------------------------------------------------------------
// <copyright file="ChecksumBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Diagnostics;
    using System.Text;
    using SmartAquaponic.Common.Execptions;
    using SmartAquaponic.Common.Extensions;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.DataAccess.Mappers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// ChecksumBll.
    /// </summary>
    public class ChecksumBll : ICrud<Checksum>
    {
        private readonly string separator = "sa";
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly CryptographyBll cryptographyBll;
        private readonly ChecksumDal mapper;

        public ChecksumBll()
        {
            this.cryptographyBll = new CryptographyBll();
            this.mapper = new ChecksumDal();
        }

        public ChecksumBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.cryptographyBll = new CryptographyBll();
            this.mapper = new ChecksumDal();
        }

        /// <inheritdoc/>
        public int Update(Log entity)
        {
            return this.mapper.Update(entity, this.CalculateChecksum(entity));
        }

        /// <inheritdoc/>
        public int Update(User entity)
        {
            return this.mapper.Update(entity, this.CalculateChecksum(entity));
        }

        /// <inheritdoc/>
        public IList<Checksum> Read()
        {
            return this.mapper.Read();
        }

        /// <summary>
        /// CalculateChecksum.
        /// </summary>
        /// <param name="entity">Log.</param>
        /// <returns>Result as int.</returns>
        private int CalculateChecksum(Log entity)
        {
            var result = string.Join(this.separator, new string[]
            {
                entity.Event.ToString(),
                entity.Id.ToString(),
                entity.Ip,
                entity.Message,
            });

            return this.GetCheckDigit(result);
        }

        /// <summary>
        /// CalculateChecksum.
        /// </summary>
        /// <param name="entity">User.</param>
        /// <returns>Result as int.</returns>
        private int CalculateChecksum(User entity)
        {
            var result = string.Join(this.separator, new string[]
            {
                entity.Id.ToString(),
                entity.IsLocked.ToString(),
                entity.IsDeleted.ToString(),
                entity.LastName,
                entity.Name,
                entity.Email,
                entity.Password,
                entity.Username,
            });

            var num = this.GetCheckDigit(result);

            return num;
        }


        /// <summary>
        /// ValidateChecksum.
        /// </summary>
        /// <param name="entity">User.</param>
        /// <returns>Result as bool.</returns>
        public bool ValidateChecksum(User entity)
        {
            var hash = this.CalculateChecksum(entity);
            return hash == entity.Hash;
        }

        /// <summary>
        /// ValidateChecksum.
        /// </summary>
        /// <param name="entity">Log.</param>
        /// <returns>Result as bool.</returns>
        public bool ValidateChecksum(Log entity)
        {
            var hash = this.CalculateChecksum(entity);
            return hash == entity.Hash;
        }

        /// <summary>
        /// ValidateIntegrity.
        /// </summary>
        /// <returns>Result as bool.</returns>
        public bool ValidateIntegrity()
        {
            this.LogMessage("Validating Integrity.", EventType.Warning);

            var result = new StringBuilder();

            // Validate each user
            var users = new UserBll().Read();
            var sumUser = 0;

            foreach (var user in users)
            {
                user.Username = this.cryptographyBll.Encrypt(user.Username);
                user.Email = this.cryptographyBll.Encrypt(user.Email);

                sumUser += user.Hash;

                if (!this.ValidateChecksum(user))
                {
                    result.AppendLine($"<br />{nameof(User)} {user.Id} integrity error.");

                    this.LogMessage($"{nameof(User)} {user.Id} integrity error.");
                }
            }

            // Validate each log
            var logs = new LogBll().Read();
            var sumLog = 0;

            foreach (var log in logs)
            {
                log.Message = this.cryptographyBll.Encrypt(log.Message);

                sumLog += log.Hash;

                if (!this.ValidateChecksum(log))
                {
                    result.AppendLine($"<br />{nameof(Log)} {log.Id} integrity error.");

                    this.LogMessage($"{nameof(Log)} {log.Id} integrity error.");
                }
            }

            // Get checksum
            var checksums = this.Read();

            // Validate user
            var userChecksum = checksums.FirstOrDefault(x => x.Table.Equals(nameof(User)));

            if (userChecksum != null && userChecksum.Hash != sumUser)
            {
                result.AppendLine($"<br />{nameof(User)} checksum error {userChecksum.Id}.");

                this.LogMessage($"{nameof(User)} checksum error {userChecksum.Id}.");
            }

            // TODO: check, beacuse logs is updething...
            // Validate user
            var logChecksum = checksums.FirstOrDefault(x => x.Table.Equals(nameof(Log)));

            if (logChecksum != null && logChecksum.Hash != sumLog)
            {
                result.AppendLine($"<br />{nameof(Log)} checksum error {logChecksum.Id}.");

                this.LogMessage($"{nameof(Log)} checksum error {logChecksum.Id}.");
            }

            if (!string.IsNullOrEmpty(result.ToString()))
            {
                throw new IntegrityException(result.ToString(), Constants.Errors.IntegrityFail);
            }

            this.LogMessage("Validation OK.", EventType.Warning);

            return true;
        }

        public void ResetIntegrity()
        {
            this.LogMessage("Reset Integrity.", EventType.Warning);

            this.ResetIntegrityUser();
            this.ResetIntegrityLog();
        }

        private void ResetIntegrityUser()
        {
            var users = new UserBll().Read();

            foreach (var user in users)
            {
                user.Username = this.cryptographyBll.Encrypt(user.Username);
                user.Email = this.cryptographyBll.Encrypt(user.Email);

                this.Update(user);
            }
        }

        private void ResetIntegrityLog()
        {
            var logs = new LogBll().Read();

            foreach (var log in logs)
            {
                log.Message = this.cryptographyBll.Encrypt(log.Message);

                this.Update(log);
            }
        }

        private int GetCheckDigit(string text)
        {
            var chars = text.ToUpper().Reverse().ToArray();

            var sum = Enumerable
                .Range(0, chars.Count())
                .Sum(i => (int)char.GetNumericValue(chars[i]) * (i % 2 == 0 ? 3 : 1));

            return (10 - sum % 10) % 100;
        }

        private void LogMessage(string message, EventType eventType = EventType.Error)
        {
            var log = new Log()
            {
                Event = eventType,
                Ip = this.ip,
                Message = message,
                User = this.currentUser,
            };

            new LogBll().Create(log);
        }

        /// <inheritdoc/>
        public int Create(Checksum entity)
        {
            // TODO: no required because USP update table checksum
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public int Delete(Checksum entity)
        {
            // TODO: no required because USP update table checksum
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public Checksum Read(int id)
        {
            // TODO: no required because USP update table checksum
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public int Update(Checksum entity)
        {
            // TODO: no required because USP update table checksum
            throw new NotImplementedException();
        }
    }
}
