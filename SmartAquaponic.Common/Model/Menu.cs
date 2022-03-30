// --------------------------------------------------------------------
// <copyright file="Menu.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Common.Model
{
    using System.Collections.Generic;
    using System.Text;

    /// <summary>
    /// Menu.
    /// </summary>
    public class Menu
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="Menu"/> class.
        /// </summary>
        public Menu()
        {
            this.Items = new List<Menu>();
            this.Display = true;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="Menu"/> class.
        /// </summary>
        /// <param name="text">Text.</param>
        /// <param name="redirect">Redirect.</param>
        public Menu(string text, string redirect)
        {
            this.Items = new List<Menu>();
            this.Display = true;
            this.Text = text;
            this.Redirect = redirect;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="Menu"/> class.
        /// </summary>
        /// <param name="text">Text.</param>
        /// <param name="redirect">Redirect.</param>
        public Menu(string text, string redirect, IList<string> roles)
        {
            this.Items = new List<Menu>();
            this.Display = true;
            this.Text = text;
            this.Redirect = redirect;
            this.Roles = roles;
        }

        /// <summary>
        /// Gets or sets Redirect.
        /// </summary>
        public string Redirect { get; set; }

        /// <summary>
        /// Gets or sets Text.
        /// </summary>
        public string Text { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether Display.
        /// </summary>
        public bool Display { get; set; }

        /// <summary>
        /// Gets or sets Roles.
        /// </summary>
        public IList<string> Roles { get; set; }

        /// <summary>
        /// Gets or sets Items.
        /// </summary>
        public IList<Menu> Items { get; set; }

        public override string ToString()
        {
            var sb = new StringBuilder();

            if (this.Display)
            {
                sb.AppendLine("<li class='nav-item dropdown'>");

                if (this.Items == null || this.Items?.Count == 0)
                {
                    sb.AppendLine($"<a class='nav-link' href='{this.Redirect}' tabindex='-1' aria-disabled='true'>{this.Text}</a>");
                }
                else
                {
                    sb.AppendLine($"<a class='nav-link dropdown-toggle' href='{this.Redirect}' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>{this.Text}</a>");
                    sb.AppendLine("<div class='dropdown-menu' aria-labelledby='navbarDropdown'>");

                    foreach (var item in this.Items)
                    {
                        if (item.Display)
                        {
                            sb.AppendLine($"<a class='dropdown-item' href='{item.Redirect}'>{item.Text}</a>");
                        }
                    }

                    sb.AppendLine("</div>");
                }

                sb.AppendLine("</li>");
            }

            return sb.ToString();
        }
    }
}
