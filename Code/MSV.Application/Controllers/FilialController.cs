using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MSV.Domain.Entities;
using MSV.Service.Services;
using System;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/Filial")]
    public class FilialController : Controller
    {
        private readonly FilialService _service = new FilialService();

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Get()
        {
            try
            {
                return Ok(_service.Get());
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("{id:int}")]
        public ActionResult Get(int id)
        {
            try
            {
                return Ok(_service.Get(id));
            }
            catch (ArgumentException ex)
            {
                return NotFound(ex);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("{codEmpresa:int}")]
        public ActionResult GetFilialByEmpresa(int codEmpresa)
        {
            try
            {
                return Ok(_service.GetFilialByEmpresa(codEmpresa));
            }
            catch (ArgumentException ex)
            {
                return NotFound(ex);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
