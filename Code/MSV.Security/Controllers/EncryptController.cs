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
    public class EncryptController : ApiController
    {
        [HttpGet]
        [AllowAnonymous]
        [Route("EncQueryStr")]
        public HttpResponseMessage EncQueryStr(string login)
        {
            string retorno = string.Empty;

            try
            {
                retorno = Encriptacao.EncQueryStr(login);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message.ToString());
            }

            return Request.CreateResponse(retorno);
        }
    }
}
