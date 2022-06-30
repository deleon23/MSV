using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MSV.Application.Bas;
using MSV.Service.Services;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/ParametroCampo")]
    [Bas]
    public class ParametroCampoController : Controller
    {
        private readonly ParametroCampoService _service = new ParametroCampoService();

        /// <summary>
        /// Buscar todas as informacoes via Proc
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get()
        {
            try
            {
                return Ok(_service.List());
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        [Route("filter")]
        public IActionResult Get([FromBody] IDictionary<string, string> filters)
        {
            try
            {
                return Ok(_service.List(filters));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
