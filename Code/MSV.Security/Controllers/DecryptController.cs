using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using cflibrary;
using MSV.ApplicationSecurity;
using Newtonsoft.Json;

namespace MSV.ApplicationSecurity.Controllers
{
    public class DecryptController : ApiController
    {
        [HttpGet]
        [AllowAnonymous]
        [Route("DecQueryStr")]
        public HttpResponseMessage DecQueryStr(string hash)
        {
            string retorno = string.Empty;
            string login = string.Empty;

            try
            {
                Function func = new Function();

                if (func.ValidaHash(hash, ref login))
                {
                    retorno = Encriptacao.DecQueryStr(login);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "Hash inválido.");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message.ToString());
            }

            return Request.CreateResponse(retorno);
        }
    }
}
