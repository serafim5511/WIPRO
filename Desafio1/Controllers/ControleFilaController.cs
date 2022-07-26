using Microsoft.AspNetCore.Mvc;
using Entities.Models;
using Desafio1.Services;

namespace Desafio1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ControleFilaController : ControllerBase
    {
        public ControleFilaController()
        {
        }

        [HttpGet("GetItemFila")]
        public IActionResult GetItemFila()
        {
            var teste = new FilaService();
            var gravar = teste.RetornarUltiomItemTxt();

            return Ok(gravar);
        }
        [HttpPost("AddItemFila")]
        public IActionResult AddItemFila([FromBody] Fila fila)
        {
            var gravar = new FilaService().Atualizar(fila);

            return Ok(gravar);
        }
    }
}
