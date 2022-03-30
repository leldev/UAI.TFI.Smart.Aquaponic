using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace SmartAquaponic.Common.Helpers
{
    /// <summary>
    /// EmailHelper.
    /// </summary>
    public static class EmailHelper
    {
        private static readonly string from = "smart.aquaponic.ar@gmail.com";
        private static readonly string fromName = "Smart Aquaponic";
        private static readonly string password = "P2ssw0rd";

        public static void SendEmail(string to, string subject, string body)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(to);
            mail.From = new MailAddress(from, fromName, System.Text.Encoding.UTF8);
            mail.Subject = subject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = body;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;

            using (SmtpClient client = new SmtpClient())
            {
                client.UseDefaultCredentials = false;
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.Credentials = new NetworkCredential(from, password);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;

                try
                {
                    client.Send(mail);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}
