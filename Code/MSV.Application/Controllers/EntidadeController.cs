using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MSV.Service.Services;
using System;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/Entidade")]
    public class EntidadeController : Controller
    {
        private readonly EntidadeService _service = new EntidadeService();

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
        [Route("{codEntidade:int}")]
        public ActionResult GetSubclienteByClient(int codEntidade)
        {
            try
            {
                return Ok(_service.GetSubclienteByClient(codEntidade));
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
        [Route("cliente")]
        public ActionResult GetClientes()
        {
            try
            {
                return Ok(_service.GetClientes());
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
        [Route("subcliente")]
        public ActionResult GetSubClientes()
        {
            try
            {
                return Ok(_service.GetSubClientes());
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
