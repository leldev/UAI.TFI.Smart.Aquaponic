// --------------------------------------------------------------------
// <copyright file="Group.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System.Collections.Generic;

    /// <summary>
    /// Group.
    /// </summary>
    public class Group : Role
    {
        /// <summary>
        /// Gets or sets Roles.
        /// </summary>
        public IList<Role> Roles { get; set; }

        public override bool IsValid(string role)
        {
            var result = false;
            
            foreach (var item in this.Roles)
            {
                if (item.IsValid(role))
                {
                    result = true;
                    break;
                }
            }

            return result;
        }
    }
}
