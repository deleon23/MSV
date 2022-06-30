using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MSV.Service.Services;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/PrecoServicoContrato")]
    public class PrecoServicoContratoController : Controller
    {
        private readonly PrecoServicoContratoService _service = new PrecoServicoContratoService();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cod_contrato"></param>
        /// <param name="cod_servico"></param>
        /// <param name="cod_reduzido"></param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("PrecoServicoContrato/{cod_contrato:int}/{cod_servico:int}/{cod_reduzido:int}")]
        [Route("PrecoServicoContrato/{cod_contrato:int}/{cod_servico:int}")]
        public IActionResult GetPrecoServicoContrato(int cod_contrato, int cod_servico, int? cod_reduzido)
        {
            try
            {
                return Ok(_service.ListPrecoServicoContrato(cod_contrato, cod_servico, cod_reduzido));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}