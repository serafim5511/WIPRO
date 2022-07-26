using Entities.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Entities.Helpers
{
    public class ReadExcel
    {
        private string path = "../../../../Entities/Excel/";

        public List<DadosMoedas> GetDataMoedaExcel()
        {
            var data = new List<DadosMoedas>();
            var reader = File.ReadLines(path + "DadosMoeda.csv");
            foreach (var item in reader)
            {
                if (!item.Split(";")[0].Contains("ID_MOEDA"))
                {
                    data.Add(new DadosMoedas()
                    {
                        DataRef = DateTime.Parse(item.Split(";")[1]),
                        IdMoeda = item.Split(";")[0].ToString()
                    });
                }
            }
            return data;
        }
        public List<DadosCotacao> GetDataCotacaoExcel()
        {
            var data = new List<DadosCotacao>();

            var reader = File.ReadLines(path + "DadosCotacao.csv");
            foreach (var item in reader)
            {
                if (!item.Split(";")[0].Contains("vlr_cotacao"))
                {
                    data.Add(new DadosCotacao()
                    {
                        DatCotacao = DateTime.Parse(item.Split(";")[2]),
                        CodCotacao = int.Parse(item.Split(";")[1]),
                        VlrCotacao = decimal.Parse(item.Split(";")[0])
                    });
                }
            }
            return data;
        }
        public List<DePara> GetDataDeParaExcel()
        {
            var data = new List<DePara>();

            var reader = File.ReadLines(path + "Tabela de de-para.csv");
            foreach (var item in reader)
            {
                if (!item.Split(";")[0].Contains("DadosCotacao.csv"))
                {
                    data.Add(new DePara()
                    {
                        IdMoeda = item.Split(";")[0],
                        CodCotacao = int.Parse(item.Split(";")[1]),
                    });
                }
            }
            return data;
        }
        public void GenerateCSV(List<ResultadoCotacao> data)
        {
            string dataAtual = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")
                                            .Replace("-", "_")
                                            .Replace(":", "")
                                            .Replace(" ", "_");

            File.WriteAllLines("../../../ExcelGerado/Resultado_" + dataAtual + ".csv", data.Select(item => item.IdMoeda.ToString() + 
                                                                                                           ";" + item.DataRef.ToString() + 
                                                                                                           ";" + item.VlrCotacao.ToString())
                                                                                                           .ToList());
        }
    }
}
