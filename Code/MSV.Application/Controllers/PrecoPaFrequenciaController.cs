using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MSV.Application.Bas;
using MSV.Service.Services;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/PrecoPaFrequencia")]
    public class PrecoPaFrequenciaController : Controller
    {
        private readonly PrecoPaFrequenciaService _service = new PrecoPaFrequenciaService();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filters"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        [Route("filter")]
        public IActionResult Get([FromBody] IDictionary<string, string> filters)
        {
            try
            {
                return Ok(_service.GetPrecoPaFrequencia(filters));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}