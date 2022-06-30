using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MSV.Application.Bas;
using MSV.Application.Bas.Function;
using MSV.Domain.Entities;
using MSV.Service.Services;
using Newtonsoft.Json;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/TokenAcesso")]
    public class TokenAcessoController : Controller
    {
        private readonly UserService _service = new UserService();
        /// <summary>
        /// Buscar todas as informacoes via Proc
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get(string grant_type, string client_id, string client_secret, string username)
        {
            try
            {
                if(string.IsNullOrEmpty(grant_type) || string.IsNullOrEmpty(client_id) || string.IsNullOrEmpty(client_secret) || string.IsNullOrEmpty(username))
                {
                    return BadRequest(new UnauthorizedAccessException("Dados para geração do Token inválido."));
                }

                if (Function.ValidaDadosToken(grant_type, client_id, client_secret, ref username))
                {
                    if (_service.UserExists(username))
                    {
                        string retorno = BasToken.ValidaAcessoSistemaToken(username, client_secret).Result;

                        if (retorno == "Hash inválido.")
                        {
                            return BadRequest(new UnauthorizedAccessException(retorno));
                        }

                        return Ok(retorno);
                    }
                }

                return BadRequest(new UnauthorizedAccessException("Usuário Inválido."));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}