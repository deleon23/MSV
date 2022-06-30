using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MSV.Service.Services;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/PrecoServicoPontoAtendimento")]
    public class PrecoServicoPontoAtendimentoController : Controller
    {
        private readonly PrecoServicoPontoAtendimentoService _service = new PrecoServicoPontoAtendimentoService();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cod_contrato"></param>
        /// <param name="cod_servico"></param>
        /// <param name="cod_reduzido"></param>
        /// <param name="cod_preco"></param>
        /// 
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("PrecoServicoPontoAtendimento/{cod_contrato:int}/{cod_servico:int}/{cod_reduzido:int}/{cod_preco:int}")]
        [Route("PrecoServicoPontoAtendimento/{cod_contrato:int}/{cod_servico:int}/{cod_reduzido:int}")]
        [Route("PrecoServicoPontoAtendimento/{cod_contrato:int}/{cod_servico:int}")]
        [Route("PrecoServicoPontoAtendimento/{cod_contrato:int}")]
        public IActionResult GetPrecoServicoPontoAtendimento(int cod_contrato, int cod_servico, int? cod_reduzido, int? cod_preco)
        {
            try
            {
                return Ok(_service.ListPrecoServicoPontoAtendimento(cod_contrato, cod_servico, cod_reduzido, cod_preco));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}