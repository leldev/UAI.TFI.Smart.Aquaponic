// --------------------------------------------------------------------
// <copyright file="CryptographyBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using System;
    using System.IO;
    using System.Security.Cryptography;
    using System.Text;

    /// <summary>
    /// CryptographyBll.
    /// </summary>
    public class CryptographyBll
    {
        private readonly byte[] iv = Convert.FromBase64String("ofcT4DhbnMFExf/X3y7dXA==");
        private readonly byte[] key = Convert.FromBase64String("Mukd2WV3FVesAvxes0KxHJOeMdLTNYuXXRMuTaBQlKM=");

        /// <summary>
        /// Decrypt.
        /// </summary>
        /// <param name="text">Text.</param>
        /// <returns>Result as string.</returns>
        public string Decrypt(string text)
        {
            return this.GetAesDecrypt(text, this.key, this.iv);
        }

        /// <summary>
        /// Encrypt.
        /// </summary>
        /// <param name="text">Text.</param>
        /// <param name="isHash">MD5 or AES.</param>
        /// <returns>Result as string.</returns>
        public string Encrypt(string text, bool isHash = false)
        {
            string result;

            if (isHash)
            {
                result = this.GetMD5Hash(text);
            }
            else
            {
                result = this.GetAesEncrypt(text, this.key, this.iv);
            }

            return result;
        }

        private string GetAesDecrypt(string str, byte[] key, byte[] iv)
        {
            string result = null;

            // Create an Aes object with the specified key and IV.
            using (Aes aes = Aes.Create())
            {
                aes.Key = key;
                aes.IV = iv;

                // Create a decrytor to perform the stream transform.
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                // Create the streams used for decryption.
                using (MemoryStream msDecrypt = new MemoryStream(Convert.FromBase64String(str)))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            // Read the decrypted bytes from the decrypting stream and place them in a string.
                            result = srDecrypt.ReadToEnd();
                        }
                    }
                }
            }

            return result;
        }

        private string GetAesEncrypt(string str, byte[] key, byte[] iv)
        {
            string result;

            // Create an Aes object with the specified key and IV.
            using (Aes aes = Aes.Create())
            {
                aes.Key = key;
                aes.IV = iv;

                // Create a decrytor to perform the stream transform.
                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                // Create the streams used for encryption.
                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            // Write all data to the stream.
                            swEncrypt.Write(str);
                        }

                        result = Convert.ToBase64String(msEncrypt.ToArray());
                    }
                }
            }

            return result;
        }

        private string GetMD5Hash(string str)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                // Convert the input string to a byte array and compute the hash.
                byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(str));

                // Create a new Stringbuilder to collect the bytes
                var sb = new StringBuilder();

                // Loop through each byte of the hashed data
                // and format each one as a hexadecimal string.
                for (int i = 0; i < data.Length; i++)
                {
                    sb.Append(data[i].ToString("x2"));
                }

                // Return the hexadecimal string.
                return sb.ToString();
            }
        }
    }
}
