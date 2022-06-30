using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace MSV.Application.Bas.Encrypt
{
    public class EncryptCflib
    {
        public static async Task<string> Decrypt(string login)
        {
            string apiResponse = string.Empty;

            using (var httpClient = new HttpClient())
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
                      .SetBasePath(Path.Combine(Directory.GetCurrentDirectory()))
                      .AddJsonFile("appsettings.json")
                      .Build();

                string grant_typeApp = "grant_type=" + configuration.GetSection("Bas:CflibHash:grant_type").Value.ToString();
                string client_idApp = "client_id=" + configuration.GetSection("Bas:CflibHash:client_id").Value.ToString();
                string client_secretApp = "client_secret=" + configuration.GetSection("Bas:CflibHash:client_secret").Value.ToString();
                string username = "username=" + login;

                string baseUrl = configuration.GetSection("Bas:httpBasDecryptCflibVB6").Value;

                var http = (HttpWebRequest)WebRequest.Create(new Uri(baseUrl));
                http.Accept = "application/json";
                http.ContentType = "application/json";
                http.Method = "GET";

                Function.Function func = new Function.Function();

                using (var response = httpClient.GetAsync(http.RequestUri + func.Enc2x(grant_typeApp +"&"+ client_idApp + "&" + client_secretApp + "&" + username)))
                {
                   return  apiResponse = await response.Result.Content.ReadAsStringAsync();
                }
            }
        }
    }
}
