using JetBrains.Annotations;
using Microsoft.EntityFrameworkCore;
using SmartAquaponic.Domain;
using SmartAquaponic.Domain.Enum;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartAquaponic.NetCoreConsole
{
    public class Context : DbContext
    {
        public virtual DbSet<Checksum> Checksum { get; set; }
        public virtual DbSet<Communication> Communication { get; set; }
        public virtual DbSet<Decor> Decor { get; set; }
        public virtual DbSet<Fish> Fish { get; set; }
        public virtual DbSet<Group> Group { get; set; }
        public virtual DbSet<Lamp> Lamp { get; set; }
        public virtual DbSet<Log> Log { get; set; }
        public virtual DbSet<Plant> Plant { get; set; }
        public virtual DbSet<Pot> Pot { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<Resource> Resource { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<SpotLight> SpotLight { get; set; }
        public virtual DbSet<Tank> Tank { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserPreference> UserPreference { get; set; }
        public virtual DbSet<WaterPump> WaterPump { get; set; }
        //public virtual DbSet<User> User { get; set; }
        //public virtual DbSet<PHType> Ph { get; set; }
        //public virtual DbSet<User> Users { get; set; }
        //public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=LAPTOP-F605BNIJ;Database=SmartAquaponic;User Id=sa;Password=P2ssw0rd;");
            base.OnConfiguring(optionsBuilder); 
        }
    }
}
