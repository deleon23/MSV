using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MSV.Application.Bas;
using MSV.Domain.Entities;
using MSV.Service.Services;
using MSV.Service.Validators;

namespace MSV.Application.Controllers
{
    [Produces("application/json")]
    [Route("api/Maquina")]
    public class MaquinaController : Controller
    {
        private readonly MaquinaService _service = new MaquinaService();

        /// <summary>
        /// Método de inclusão de maquina via Entity
        /// </summary>
        /// <param name="maquina"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        [Route("maquina")]
        public IActionResult Post([FromBody] Maquina maquina)
        {
            try
            {
                _service.Post<MaquinaValidator>(maquina);

                _service.Post<MaquinaValidator>(maquina);

                _service.Post<MaquinaValidator>(maquina);



                return Ok(maquina.Id);
            }
            catch (ArgumentNullException ex)
            {
                return NotFound(ex);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        /// <summary>
        /// Método para atualização de maquina via Entity
        /// </summary>
        /// <param name="maquina"></param>
        /// <returns></returns>
        [HttpPut]
        [AllowAnonymous]
        [Route("maquina")]
        public IActionResult Put([FromBody] Maquina maquina)
        {
            try
            {
                _service.Put<MaquinaValidator>(maquina);

                return Ok(maquina);
            }
            catch (ArgumentNullException ex)
            {
                return NotFound(ex);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        /// <summary>
        /// Apagar registro de maquina via Entity
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [AllowAnonymous]
        [Route("maquina")]
        public IActionResult Delete(int id)
        {
            try
            {
                _service.Delete(id);

                return Ok();
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

        /// <summary>
        /// Buscar todas as maquinas da base via Entity
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("maquina")]
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
        /// Buscar uma maquina especifica pelo id via Entity
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("maquina/{id:int}")]
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

        /// <summary>
        /// Buscar uma maquina especifica pelo id via Entity
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("maquinaTeste/{id:int}")]
        public IActionResult GetMaquina(int id)
        {
            try
            {
                return Ok(_service.GetMaquina(id));
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

        /// <summary>
        /// Buscar todas as maquinas da base via Entity com limitação de quantidade
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("maquina/{count:int}")]
        public IActionResult GetCountMaquina(int count)
        {
            try
            {
                return Ok(_service.GetCountMaquina(count));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        /// <summary>
        /// Buscar todas as maquinas da base via Entity com limitação de quantidade
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("maquina/{des}")]
        public IActionResult GetMaquinaPreco(string des)
        {
            try
            {
                return Ok(_service.GetMaquinaPrecoDes(des));
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        /// <summary>
        /// Buscar todas as maquinas da base via Entity com limitação de quantidade
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [AllowAnonymous]
        [Route("MaquinaPrecoAtendimento")]
        public IActionResult MaquinaPrecoAtendimento()
        {
            try
            {
                return Ok(_service.GetMaquinaPrecoPontoAtendimento());
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}