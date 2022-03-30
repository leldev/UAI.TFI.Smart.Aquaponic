// --------------------------------------------------------------------
// <copyright file="UserBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using SmartAquaponic.Common.Execptions;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.DataAccess.Mappers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// UserBll.
    /// </summary>
    public class UserBll : ICrud<User>
    {
        private readonly int maxLoginAttempts = 3;
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly CryptographyBll cryptographyBll;
        private readonly UserDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserBll"/> class.
        /// </summary>
        public UserBll()
        {
            this.cryptographyBll = new CryptographyBll();
            this.mapper = new UserDal();
        }

        public UserBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.cryptographyBll = new CryptographyBll();
            this.mapper = new UserDal();
        }

        /// <inheritdoc/>
        public int Create(User entity)
        {
            // TODO: CU El sistema valida que el usuario no se encuentre en uso
            var password = entity.Password;
            var email = entity.Email;

            if (string.IsNullOrEmpty(entity.Password))
            {
                password = this.GeneratePassword();
                entity.Password = password;
                entity.TempPassword = password;
                entity.TempPassword = this.cryptographyBll.Encrypt(entity.TempPassword, true);
            }

            entity.Username = this.cryptographyBll.Encrypt(entity.Username);
            entity.Email = this.cryptographyBll.Encrypt(entity.Email);
            entity.Password = this.cryptographyBll.Encrypt(entity.Password, true);

            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                EmailHelper.SendEmail(email, "Welcome to Smart Aquaponic", password);

                entity.Id = id;
                new ChecksumBll().Update(entity);

                this.LogMessage($"User {id} created.");
            }

            return id;
        }

        public int RecoveryPassword(User entity)
        {
            // TODO: CU
            var password = this.GeneratePassword();
            var email = entity.Email;

            entity.TempPassword = this.cryptographyBll.Encrypt(password, true);
            entity.Email = this.cryptographyBll.Encrypt(entity.Email);

            var id = this.mapper.RecoveryPassword(entity);

            if (id > 0)
            {
                EmailHelper.SendEmail(email, "Your new temporary password", password);

                this.LogMessage($"Password generated to {id} {email}.");
            }

            return id;
        }

        public int ResetPassword(User entity)
        {
            // TODO: CU
            var u = this.Read(entity.Id);
            var tempPassword = this.cryptographyBll.Encrypt(entity.TempPassword, true);

            if (u.TempPassword.Equals(tempPassword))
            {
                entity.Password = this.cryptographyBll.Encrypt(entity.Password, true);
            }
            else
            {
                return Convert.ToInt32(Constants.Errors.LoginFail);
            }

            var id = this.mapper.ResetPassword(entity);

            if (id > 0)
            {
                // TODO: update CU
                this.UpdateChecksum(id);

                this.LogMessage($"User {id} Password reseted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(User entity)
        {
            var id = this.mapper.Delete(entity);
            if (id > 0)
            {
                // TODO: update CU
                this.UpdateChecksum(id);

                this.LogMessage($"User {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public User Read(int id)
        {
            var user = this.mapper.Read(id);

            if (user != null)
            {
                // TODO: Add this in CU
                user.Username = this.cryptographyBll.Decrypt(user.Username);
                user.Email = this.cryptographyBll.Decrypt(user.Email);

                // Get roles
                user.Roles = new PermissionBll().GetUserRoles(id);
            }

            return user;
        }

        /// <inheritdoc/>
        public IList<User> Read()
        {
            var users = this.mapper.Read().ToList();

            // TODO: Add this in CU
            users.ForEach((user) =>
            {
                user.Username = this.cryptographyBll.Decrypt(user.Username);
                user.Email = this.cryptographyBll.Decrypt(user.Email);
            });

            return users;
        }

        /// <inheritdoc/>
        public int Update(User entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                // TODO: update CU
                this.UpdateChecksum(id);
                this.LogMessage($"User {id} updated.");
            }

            return id;
        }

        /// <summary>
        /// Login.
        /// </summary>
        /// <param name="username">Username.</param>
        /// <param name="password">Password.</param>
        /// <returns>Result as User.</returns>
        public User Login(string username, string password)
        {
            var user = this.mapper.Login(this.cryptographyBll.Encrypt(username));

            // TODO: CU ValidateUser
            if (this.ValidateUser(user, this.cryptographyBll.Encrypt(password, true)))
            {
                if (new ChecksumBll().ValidateChecksum(user))
                {
                    if (this.IsUserLocked(user))
                    {
                        throw new LoginException(Constants.Messages.UserLocked, Constants.Errors.UserLocked);
                    }
                    else
                    {
                        // Get roles
                        user.Roles = new PermissionBll().GetUserRoles(user.Id);

                        if (this.HasUserLoginRole(user))
                        {
                            this.ResetLoginAttemps(user);

                            // Get preference
                            user.Preference = new UserPreferenceBll().Read(user.Preference.Id);

                            this.LogMessage($"User login {user.Id} - {user.ToString()}.");
                        }
                        else
                        {
                            throw new LoginException(Constants.Messages.UserNotAllowedLogin, Constants.Errors.UserNotAllowedLogin);
                        }
                    }
                }
                else
                {
                    throw new LoginException(Constants.Messages.UserChecksumFail, Constants.Errors.UserChecksumFail);
                }
            }
            else
            {
                throw new LoginException(Constants.Messages.LoginFail, Constants.Errors.LoginFail);
            }


            return user;
        }

        /// <summary>
        /// Logout.
        /// </summary>
        /// <param name="user">User.</param>
        /// <returns>Result as bool.</returns>
        public void Logout(User user)
        {
            // TODO: update CU.
            this.LogMessage($"User logout {user.Id}.");
        }

        /// <summary>
        /// Unlock.
        /// </summary>
        /// <param name="user">User.</param>
        /// <returns>Result as int.</returns>
        public int Unlock(User user)
        {
            var id = this.mapper.Unlock(user);

            if (id > 0)
            {
                // TODO: update CU
                this.UpdateChecksum(id);
                this.LogMessage($"User {user.Id} unlocked.");
            }

            return id;
        }

        /// <summary>
        /// Recovery.
        /// </summary>
        /// <param name="user">User.</param>
        /// <returns>Result as int.</returns>
        public int Recovery(User user)
        {
            var id = this.mapper.Recovery(user);

            if (id > 0)
            {
                // TODO: update CU
                this.UpdateChecksum(id);
                this.LogMessage($"User {user.Id} recovered.");
            }

            return id;
        }

        private void ResetLoginAttemps(User user)
        {
            user.LoginAttempts = 0;
            user.IsLocked = false;

            var id = this.mapper.UpdateLoginAttempts(user);

            if (id > 0)
            {
                // TODO: update CU
                this.UpdateChecksum(id);
            }
        }

        private string GeneratePassword()
        {
            var charts = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            var length = 12;
            var sb = new StringBuilder();
            var rnd = new Random();

            while (0 < length--)
            {
                sb.Append(charts[rnd.Next(charts.Length)]);
            }

            return sb.ToString();
        }

        private bool HasUserLoginRole(User user)
        {
            var result = false;

            foreach (var role in user.Roles)
            {
                if (role is Group)
                {
                    var group = role as Group;

                    if (group.IsValid(Constants.Permission.Login))
                    {
                        result = true;
                        break;
                    }
                }
                else
                {
                    if (role.IsValid(Constants.Permission.Login))
                    {
                        result = true;
                        break;
                    }
                }
            }

            return result;
        }

        private void IncriseLoginAttemps(User user)
        {
            user.LoginAttempts++;
            user.IsLocked = user.LoginAttempts >= this.maxLoginAttempts;
            var id = this.mapper.UpdateLoginAttempts(user);

            if (id > 0)
            {
                // TODO: update CU
                this.UpdateChecksum(id);
            }
        }

        private bool IsUserLocked(User user)
        {
            return user.IsLocked;
        }

        private bool ValidateUser(User user, string password)
        {
            if (user == null)
            {
                return false;
            }
            else
            {
                if (string.IsNullOrEmpty(user.TempPassword))
                {
                    if (user.Password.Equals(password))
                    {
                        return true;
                    }
                }
                else
                {
                    if (user.TempPassword.Equals(password))
                    {
                        throw new UserMustResetPasswordException(user.Id.ToString());
                    }
                }

                this.IncriseLoginAttemps(user);
                return false;
            }
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

        private void UpdateChecksum(int id)
        {
            // TODO: update CU
            var user = this.mapper.Read(id);
            new ChecksumBll().Update(user);
        }
    }
}
