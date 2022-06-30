using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MSV.Service.Services;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/PontoAtendimentoOrigem")]
    public class PontoAtendimentoOrigemController : Controller
    {
        private readonly PontoAtendimentoOrigemService _service = new PontoAtendimentoOrigemService();

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("PontoAtendimentoOrigem/{cod_contrato:int}/{id_contratopontoatendimento:int}")]
        public IActionResult GetPontoAtendimentoOrigem(int cod_contrato, int? id_contratopontoatendimento = 0)
        {
            try
            {
                return Ok(_service.ListPontoAtendimentoOrigem(cod_contrato, id_contratopontoatendimento));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}