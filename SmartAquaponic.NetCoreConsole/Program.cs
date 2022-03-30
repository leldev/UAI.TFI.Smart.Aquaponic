using AutoFixture;
using Newtonsoft.Json;
using SmartAquaponic.Business;
using SmartAquaponic.Common.Helpers;
using SmartAquaponic.DataAccess.Mappers;
using SmartAquaponic.Domain;
using SmartAquaponic.Domain.Enum;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Security.Authentication.ExtendedProtection;
using System.Text;
using System.Threading.Tasks;

namespace SmartAquaponic.NetCoreConsole
{
    class Program
    {
        static async Task Main(string[] args)
        {
            string text = GiveMeFromResources();

            //string subscriptionKey = "21a356fd93ca4bc1893cfaf94f30dec9";
            //string endpoint = "https://api.cognitive.microsofttranslator.com/";

            //// Add your location, also known as region. The default is global.
            //// This is required if using a Cognitive Services resource.
            //string location = "brazilsouth";

            //// Input and output languages are defined as parameters.
            //string route = "/translate?api-version=3.0&from=en&to=es";
            //string textToTranslate = "Hello";
            //object[] body = new object[] { new { Text = textToTranslate }, new { Text = "World" } };
            //var requestBody = JsonConvert.SerializeObject(body);

            //using (var client = new HttpClient())
            //using (var request = new HttpRequestMessage())
            //{
            //    // Build the request.
            //    request.Method = HttpMethod.Post;
            //    request.RequestUri = new Uri(endpoint + route);
            //    request.Content = new StringContent(requestBody, Encoding.UTF8, "application/json");
            //    request.Headers.Add("Ocp-Apim-Subscription-Key", subscriptionKey);
            //    request.Headers.Add("Ocp-Apim-Subscription-Region", location);

            //    // Send the request and get response.
            //    HttpResponseMessage response = await client.SendAsync(request).ConfigureAwait(false);
            //    // Read response as a string.
            //    string result = await response.Content.ReadAsStringAsync();
            //    Console.WriteLine(result);
            //}








            var aux = new List<SuperHero>()
            {
                //new SuperHero("Tony", "Stark","ironman", true),
                //new SuperHero("Bruce", "Wayne","batman", false),
                //new SuperHero("Bruce", "Banner","hulk", true),
                //new SuperHero("Peter", "Parker","spiderman", true),
                //new SuperHero("Barry", "Allen","the.flash", false),
                //new SuperHero("Steve", "Rogers","captain.america", true),
                //new SuperHero("T'", "Challa","black.panther", true),
                //new SuperHero("Natasha", "Romanoff","black.widow", true),
                //new SuperHero("Clark", "Kent","superman", false),
                //new SuperHero("Charles", "Xavier","professor.x", true),
                //new SuperHero("Diana", "Prince","Wonder.Woman", false),
                //new SuperHero("Hal", "Jordan","Green.Lantern", false),
                //new SuperHero("Peter", "Quill","Starlord", true),
                //new SuperHero("Kara", "Danvers","supergirl", false),
                //new SuperHero("Clint", "Barton","Hawkeye", true),
                //new SuperHero("Wade ", "Wilson","Deadpool", true),
                //new SuperHero("Selina ", "Kyle","catwoman", false),
                //new SuperHero("Oliver ", "Queen","Green.Arrow", false),
                //new SuperHero("Matthew ", "Murdock","Daredevil", true),
                //new SuperHero("Hank ", "Pym","Antman", true),
                //new SuperHero("Barbara ", "Gordon","Batgirl", false),
                //new SuperHero("Scott ", "Summers","Cyclops", true),
                //new SuperHero("Arthur ", "Curry","Aquaman", false),
                //new SuperHero("Jean ", "Grey","Phoenix", true),
                //new SuperHero("Sam ", "Wilson","Falcon", true),
                //new SuperHero("Frank ", "Castle","The.Punisher", true),
                //new SuperHero("Johnny ", "Blaze","Ghost.Rider", true),
                //new SuperHero("Damian ", "Wayne","robin", false),
                //new SuperHero("James ", "Barnes","Winter.Soldier", true),
                //new SuperHero("Jason ", "Todd","Red.Hood", false),
                //new SuperHero("James ", "Howlett","Wolverine", true),
                //new SuperHero("Billy ", "Batson","Shazam", false),
                //new SuperHero("Dinah ", "Lance","Black.Canary", false),
                //new SuperHero("Victor ", "Stone","Cyborg", false),
                //new SuperHero("Remy ", "LeBeau","Gambit", true),
                //new SuperHero("Piotr", "Rasputin","Colossus", true),
                //new SuperHero("Daniel", "Rand","Iron.Fist", true),
                //new SuperHero("Rachel", "Roth","Raven", true),
            };

            //foreach (var item in aux)
            //{

            //    var result = new UserBll().Create(
            //                new User()
            //                {
            //                    Name = item.Name,
            //                    LastName = item.LastName,
            //                    Username = item.Username,
            //                    Email = item.Email,
            //                    Password = "P2ssw0rd",
            //                    Preference = new UserPreference()
            //                    {
            //                        Id = 1,
            //                    },
            //                    Roles = new List<Role>() { new Role() { Id = 1 } },
            //                });
            //}

            //foreach (var key in ResourceHelper.resources.Keys)
            //{
            //    Console.WriteLine(key);
            //    Console.WriteLine(ResourceHelper.resources[key]);
            //}
            //EmailHelper.SendEmail("smart.aquaponic.ar@gmail.com", "Subject", "Body");
            //POC();
            //var a = new LogBll();

            //for (int i = 0; i < 1000; i++)
            //{

            //a.Create(new Log()
            //{
            //    Ip = "192.061561156",
            //    Message = "Hello",
            //    User = new User()
            //    {
            //        Id = 12,
            //    },
            //});

            //a.Create(new Log()
            //{
            //    Ip = "192.111222333",
            //    Message = "1",
            //});

            //a.Create(new Log()
            //{
            //    Ip = "2000",
            //    Message = "b",
            //    User = new User()
            //    {
            //        Id = 20,
            //    },
            //});
            //}

            //var g = a.Read();
        }

        private static string GiveMeFromResources()
        {
            var sb = new StringBuilder();
            var index = 0;
            var go = "GO";
            var resourceFormat = "INSERT [dbo].[Resource] ([ResourceId], [CreatedDate], [ModifiedDate], [Key]) VALUES ({0}, CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), CAST(N'2020-08-17T13:33:19.6766667' AS DateTime2), N'{1}')";
            var langFormat = "INSERT [dbo].[PreferenceResource] ([UserPreferenceId], [ResourceId], [Value]) VALUES ({0}, {1}, N'{2}')";

            sb.AppendLine("/****** Resource ******/");
            sb.AppendLine("SET IDENTITY_INSERT [dbo].[Resource] ON");
            sb.AppendLine(go);

            foreach (var item in SmartAquaponic.Common.Helpers.ResourceHelper.resources)
            {
                sb.AppendFormat(resourceFormat, index + 1, item.Key);
                sb.AppendLine();
                sb.AppendLine(go);
                index++;
            }

            sb.AppendLine("SET IDENTITY_INSERT [dbo].[Resource] OFF");
            sb.AppendLine(go);


            index = 0;

            sb.AppendLine("/****** English ******/");

            foreach (var item in SmartAquaponic.Common.Helpers.ResourceHelper.resources)
            {
                sb.AppendFormat(langFormat, 1, index + 1, item.Value);
                sb.AppendLine();
                sb.AppendLine(go);
                index++;
            }

            index = 0;

            sb.AppendLine("/****** Spanish ******/");

            foreach (var item in SmartAquaponic.Common.Helpers.ResourceHelper.resources)
            {
                sb.AppendFormat(langFormat, 2, index + 1, item.Value);
                sb.AppendLine();
                sb.AppendLine(go);
                index++;
            }

            return sb.ToString();
        }

        const string marvelEmail = "@marvel.com";
        const string dcEmail = "@dc.com";

        public class SuperHero
        {
            public SuperHero(string name, string lastName, string username, bool isMarvel = true)
            {
                Name = name.Trim();
                LastName = lastName.Trim();
                Username = username.ToLower();
                IsMarvel = isMarvel;

                string email = name.Trim().ToLower() + "." + lastName.Trim().ToLower();
                if (isMarvel)
                {
                    email += marvelEmail;
                }
                else
                {
                    email += dcEmail;

                }
                Email = email;
            }

            public string Name { get; set; }
            public string LastName { get; set; }
            public string Username { get; set; }
            public string Email { get; set; }
            public bool IsMarvel { get; set; }
        }

        private static void POC()
        {
            var fixture = new Fixture();
            var tank = new Tank();

            // El sistema lista los accesorios de pecera - CU-STK-010 - Listar Accesorios Pecera
            var decor = fixture.Create<Decor>();

            // El sistema lista los peces - CU-STK-006 - Listar Peces00
            //var shark = fixture.Build<Fish>()
            //    .With(x => x.Name, "Shark")
            //    .With(x => x.Predators, new List<Fish>())
            //    .With(x => x.Temp, 24.3)
            //    .With(x => x.IsLonely, false)
            //    .Create();
            //var golden = fixture.Build<Fish>()
            //    .With(x => x.Name, "Golden")
            //    .With(x => x.Predators, new List<Fish>() { shark })
            //    .With(x => x.Temp, 12)
            //    //.With(x => x.Temp, 15.2)
            //    .With(x => x.IsLonely, false)
            //    .Create();
            //var betta = fixture.Build<Fish>()
            //    .With(x => x.Name, "Betta")
            //    .With(x => x.Predators, new List<Fish>() { shark })
            //    .With(x => x.Temp, 20.2)
            //    .With(x => x.IsLonely, true)
            //    .Create();

            //// El sistema lista las bombas - CU-STK-014 - Listar Bombas
            //var wp = fixture.Create<WaterPump>();

            //// El colaborador ingresa los peces
            //tank.Fishes = new List<Fish>() { shark, golden, golden, golden, betta, betta };

            //// El colaborador ingresa los accesorios de pecera
            //tank.Decors = new List<Decor>() { decor };

            //// El colaborador ingresa los datos de la pecera
            //tank.Ph = PhType.Orange;
            //tank.WaterPump = wp;
            //tank.WaterTemp = 20.2;

            //// El sistema valida el ambiente de la pecera
            //try
            //{
            //    var tankBll = new TankBll();
            //    tankBll.Create(tank);
            //    Console.WriteLine("OK");
            //}
            //catch (Exception ex)
            //{
            //    Console.WriteLine(ex.Message);
            //}
        }
    }
}
