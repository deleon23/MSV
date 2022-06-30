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
    [Route("api/ServicosContrato")]
    public class ServicosContratoController : Controller
    {
        private readonly ServicosContratoService _service = new ServicosContratoService();

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("ServicosContrato/{cod_contrato:int}/{id_contratopontoatendimento:int}")]
        public IActionResult GetServicosContrato(int cod_contrato, int? id_contratopontoatendimento=0)
        {
            try
            {
                return Ok(_service.ListServicosContrato(cod_contrato, id_contratopontoatendimento));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}