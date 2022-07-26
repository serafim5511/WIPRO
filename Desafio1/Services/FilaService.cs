using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using Entities.Models;

namespace Desafio1.Services
{
    public class FilaService
    {
        private string path = @"data.txt";
        private IList<Fila> LerTxt()
        {
            IList<Fila> filas = null;
            using (StreamReader sr = File.OpenText(path))
            {                
                filas = JsonSerializer.Deserialize<IList<Fila>>(sr.ReadToEnd());
            }
            return filas;
        }
        private void AtualizarLista(IList<Fila> fila)
        {
            try
            {
                using (FileStream fs = File.Open(path, FileMode.Truncate))
                {
                    StreamWriter sw = new StreamWriter(fs);
                    sw.Write(JsonSerializer.Serialize(fila));
                    sw.Close();
                    fs.Close();
                }
            }
            catch (System.Exception)
            {
            }
        }
        public Fila RetornarUltiomItemTxt()
        {
            try
            {
                var retornoTxt = LerTxt();
                Fila ultimoItem = retornoTxt.Last();
                retornoTxt.Remove(ultimoItem);
                AtualizarLista(retornoTxt);

                return ultimoItem;
            }
            catch (System.Exception)
            {
                return null;
            }
        }
        public bool Atualizar(Fila fila)
        {
            try
            {
                var retornoTxt = LerTxt();
                retornoTxt.Add(fila);

                using (FileStream fs = File.Open(path, FileMode.Truncate))
                {
                    StreamWriter sw = new StreamWriter(fs);
                    sw.Write(JsonSerializer.Serialize(retornoTxt));
                    sw.Close();
                    fs.Close();
                }

                return true;
            }
            catch (System.Exception)
            {
                return false; 
            }
        }
    }
}
