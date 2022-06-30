using MSV.Domain.Entities;
using MSV.Infra.Data.Repository;
using System;
using System.Collections.Generic;

namespace MSV.Service.Services
{
    public class PrecoPaFrequenciaService : BaseService<PrecoPaFrequencia>
    {
        private readonly PrecoPaFrequenciaRepository _repository = new PrecoPaFrequenciaRepository();

        public List<PrecoPaFrequencia> GetPrecoPaFrequencia(IDictionary<string, string> filters = null)
        {
            try
            {
                var codServico = 0;
                var codContratoReduzido = 0;

                if (filters != null)
                {
                    if (filters.ContainsKey("cod_Servico") && Int32.TryParse(filters["cod_Servico"], out codServico))
                        codServico = Convert.ToInt32(filters["cod_Servico"]);

                    if (filters.ContainsKey("cod_ContratoReduzido") && Int32.TryParse(filters["cod_ContratoReduzido"], out codContratoReduzido))
                        codContratoReduzido = Convert.ToInt32(filters["cod_ContratoReduzido"]);
                }

                return _repository.SelectPrecoPaFrequencia(codContratoReduzido, codServico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
