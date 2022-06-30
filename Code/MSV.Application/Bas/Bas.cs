using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Protocols;
using MSV.Domain.Entities;
using MSV.Service.Services;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;


namespace MSV.Application.Bas
{
    public class BasAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            string controllerName = ((ControllerActionDescriptor)context.ActionDescriptor).ControllerName;

            string actionName = ((ControllerActionDescriptor)context.ActionDescriptor).ActionName;

            //Valido se o request esta vindo via swagger
            if (context.HttpContext.Request.Headers.ContainsKey("AuthorizationSwagger"))
            {
                if (BasToken.ValidaAcessoSwaggerDoc(controllerName, actionName, context).Result != 200)
                {
                    context.Result = new StatusCodeResult(401);
                }
            }
            else if (context.HttpContext.Request.Headers.ContainsKey("AuthorizationKey")) //Valido se o request esta vindo de outras fontes
            {
                int retornoValidaAcessoSistema = BasToken.ValidaAcessoSistema(controllerName, actionName, context).Result;

                if (retornoValidaAcessoSistema != 200)
                {
                    context.Result = new StatusCodeResult(retornoValidaAcessoSistema);
                }
            }
            else
            {
                context.Result = new StatusCodeResult(401);
            }

            return;
        }
    }

    public class ChaveJson
    {
        public string Chave { get; set; }
    }

    public class TokenJson
    {
        public string Token { get; set; }
    }

    public class BasToken
    {
        public static async Task<int> ValidaAcessoSistema(string controllerName, string actionName, ActionExecutingContext context)
        {
            UserService service = new UserService();
            Function.Function func = new Function.Function();

            string chaveRetorno = string.Empty;

            using (var httpClient = new HttpClient())
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
                   .SetBasePath(Path.Combine(Directory.GetCurrentDirectory()))
                   .AddJsonFile("appsettings.json")
                   .Build();

                chaveRetorno = context.HttpContext.Request.Headers["AuthorizationKey"];

                string[] arrayToken = chaveRetorno.Split("_&_");

                chaveRetorno = arrayToken[0];

                if (service.List(func.Dec2x(arrayToken[1])).Count() > 0)
                {
                    string baseUrl = configuration.GetSection("Bas:httpBasRetornaPermissoes").Value;

                    var http = (HttpWebRequest)WebRequest.Create(new Uri(baseUrl));
                    http.Accept = "application/json";
                    http.ContentType = "application/json";
                    http.Method = "GET";

                    httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Chave", chaveRetorno);

                    using (var response = httpClient.GetAsync(http.RequestUri, HttpCompletionOption.ResponseHeadersRead))
                    {
                        string apiResponse = await response.Result.Content.ReadAsStringAsync();

                        dynamic dyn = JsonConvert.DeserializeObject(apiResponse);

                        var json = ((JObject)dyn).Children().Children().Children().ToList();

                        if (json.Where(x => x.FirstOrDefault().Values().FirstOrDefault().ToString().Equals(controllerName)).Count() > 0)
                        {
                            if (json.Where(x => x.SelectToken("Componentes").Values("Nome").FirstOrDefault().ToString().Equals(actionName)).Count() == 0)
                            {
                                return (int)HttpStatusCode.MethodNotAllowed;
                            }
                        }
                        else
                        {
                            return (int)HttpStatusCode.Unauthorized;
                        }
                    }
                }

                return (int)HttpStatusCode.OK;
            }
        }

        public static async Task<int> ValidaAcessoSwaggerDoc(string controllerName, string actionName, ActionExecutingContext context)
        {
            UserService service = new UserService();
            Function.Function func = new Function.Function();

            IConfigurationRoot configuration = new ConfigurationBuilder()
                   .SetBasePath(Path.Combine(Directory.GetCurrentDirectory()))
                   .AddJsonFile("appsettings.json")
                   .Build();

            string autSwagger = context.HttpContext.Request.Headers["AuthorizationSwagger"];

            string[] arrayToken = autSwagger.Split("_&_");

            string chaveRetorno = arrayToken[0];

            if (service.List(func.Dec2x(arrayToken[1])).Count() > 0)
            {
                using (var httpClient = new HttpClient())
                {
                    string baseUrl = configuration.GetSection("Bas:httpBasRetornaPermissoes").Value;

                    var http = (HttpWebRequest)WebRequest.Create(new Uri(baseUrl));
                    http.Accept = "application/json";
                    http.ContentType = "application/json";
                    http.Method = "GET";

                    httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Chave", chaveRetorno);

                    using (var response = httpClient.GetAsync(http.RequestUri, HttpCompletionOption.ResponseHeadersRead))
                    {
                        string apiResponse = await response.Result.Content.ReadAsStringAsync();

                        dynamic dyn = JsonConvert.DeserializeObject(apiResponse);

                        var json = ((JObject)dyn).Children().Children().Children().ToList();

                        if (json.Where(x => x.FirstOrDefault().Values().FirstOrDefault().ToString().Equals(controllerName)).Count() > 0)
                        {
                            if (json.Where(x => x.SelectToken("Componentes").Values("Nome").FirstOrDefault().ToString().Equals(actionName)).Count() == 0)
                            {
                                return (int)HttpStatusCode.MethodNotAllowed;
                            }
                        }
                        else
                        {
                            return (int)HttpStatusCode.Unauthorized;
                        }
                    }
                }
            }

            return (int)HttpStatusCode.OK;
        }

        public static async Task<string> ValidaAcessoSistemaToken(string login, string hash)
        {
            string chaveRetorno = string.Empty;

            using (var httpClient = new HttpClient())
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
                   .SetBasePath(Path.Combine(Directory.GetCurrentDirectory()))
                   .AddJsonFile("appsettings.json")
                   .Build();

                ChaveJson chave = new ChaveJson();

                chave.Chave = hash;

                string chaveJson = JsonConvert.SerializeObject(chave);

                var httpContent = new StringContent(chaveJson, Encoding.UTF8, "application/json");

                string baseUrlToken = configuration.GetSection("Bas:httpBasRetornaToken").Value;

                using (var response = httpClient.PostAsync(baseUrlToken, httpContent))
                {
                    string apiResponse = await response.Result.Content.ReadAsStringAsync();

                    dynamic dyn = JsonConvert.DeserializeObject(apiResponse);

                    chaveRetorno = ((JObject)dyn).SelectToken("Chave").ToString();

                    if (String.IsNullOrEmpty(chaveRetorno))
                    {
                        return "Hash inválido.";
                    }
                }

                Function.Function func = new Function.Function();

                TokenJson token = new TokenJson();

                token.Token = chaveRetorno + "_ & _" + func.Enc2x(login);

                return JsonConvert.SerializeObject(token);
            }
        }
    }
}
