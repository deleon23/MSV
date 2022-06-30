using MSV.Infra.Data.StoredProcedure;
using MSV.Domain.MapHelperStoreProcedure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using MSV.Domain.Dto.ProceduresEntities;
using MSV.Infra.Data.Repository;


namespace MSV.Service.Services
{
    public class PrecoServicoPontoAtendimentoService : BaseService<SelectPrecoServicoPontoAtendimentoDto>
    {
        private readonly BaseRepository<SelectPrecoServicoPontoAtendimentoDto> _repository = new BaseRepository<SelectPrecoServicoPontoAtendimentoDto>();

        public IEnumerable<SelectPrecoServicoPontoAtendimentoDto> ListPrecoServicoPontoAtendimento(int cod_contrato, int cod_servico, int? cod_reduzido, int? cod_preco)
        {
            var lstSqlParams = new List<SqlParameter>();
            var selectServicosContratoDto = new List<SelectPrecoServicoPontoAtendimentoDto>();

            try
            {
                if (cod_contrato > 0)
                {
                    lstSqlParams.Add(ParamsDefine("@Cod_Contrato", cod_contrato, SqlDbType.Int));

                    if (cod_servico > 0)
                        lstSqlParams.Add(ParamsDefine("@Cod_Servico", cod_servico, SqlDbType.Int));

                    if (cod_reduzido > 0)
                        lstSqlParams.Add(ParamsDefine("@Cod_Reduzido", cod_reduzido, SqlDbType.Int));

                    if (cod_preco > 0)
                        lstSqlParams.Add(ParamsDefine("@Cod_Preco", cod_preco, SqlDbType.Int));

                    var myDataSet = new DataSet();
                    myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectPrecoServicoPontoAtendimento, lstSqlParams);

                    var mapper = new DataNamesMapper<SelectPrecoServicoPontoAtendimentoDto>();


                    selectServicosContratoDto = mapper.Map(myDataSet).ToList();
                }
                else
                {
                    throw new ArgumentException("Código de contrato ou Código serviço inválido. Favor enviar novamente.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return selectServicosContratoDto;
        }
    }
}
