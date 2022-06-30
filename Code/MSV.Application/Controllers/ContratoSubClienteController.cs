using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MSV.Service.Services;
using System;
using System.Collections.Generic;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/ContratoSubCliente")]
    public class ContratoSubClienteController : Controller
    {
        private readonly ContratoSubClienteService _service = new ContratoSubClienteService();

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
