using Entities.Helpers;
using Entities.Models;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Linq;
using System.Collections.Generic;

namespace Desafio2._1
{
    internal class Program
    {
        private static readonly HttpClient _httpClient = new HttpClient();

        static async Task Main(string[] args)
        {
            while (true)
            {
                try
                {
                    string url = ApiRoutes.ProductService.GetItemFila;
                    var response = await _httpClient.GetAsync(url);
                    var data = await response.Content.ReadAsStringAsync();
                    Fila objetoDeserializado = JsonConvert.DeserializeObject<Fila>(data);
                    if (!(objetoDeserializado is null))
                    {
                        var moeda = new ReadExcel().GetDataMoedaExcel().Where(d => objetoDeserializado.DataInicio <= d.DataRef && objetoDeserializado.DataFim >= d.DataRef).ToList();
                        var cotacao = new ReadExcel().GetDataCotacaoExcel().Where(d => objetoDeserializado.DataInicio <= d.DatCotacao && objetoDeserializado.DataFim >= d.DatCotacao).ToList();
                        var dePara = new ReadExcel().GetDataDeParaExcel();

                        var list = new List<ResultadoCotacao>();

                        var query = (from depara in dePara
                                     join moedas in moeda on depara.IdMoeda equals moedas.IdMoeda
                                     join cotacaos in cotacao on depara.CodCotacao equals cotacaos.CodCotacao
                                     where objetoDeserializado.DataInicio <= cotacaos.DatCotacao && objetoDeserializado.DataFim >= cotacaos.DatCotacao
                                     select new ResultadoCotacao()
                                     {
                                         VlrCotacao = cotacaos.VlrCotacao.ToString(),
                                         DataRef = moedas.DataRef.ToString(),
                                         IdMoeda = moedas.IdMoeda
                                     }).ToList();
                        if (query.Count() > 0)
                        {
                            var posicao = query[0];
                            query.Add(new ResultadoCotacao()
                            {
                                VlrCotacao = "VlrCotacao",
                                DataRef = "DataRef",
                                IdMoeda = "IdMoeda"
                            });
                            int count = query.Count();
                            query[0] = query[count - 1];
                            query[count - 1] = posicao;

                            new ReadExcel().GenerateCSV(query);
                        }
                    }                    
                }
                catch (System.Exception ex)
                {

                }
                Thread.Sleep(2 * 60 * 1000);

            }
        }
    }
}
