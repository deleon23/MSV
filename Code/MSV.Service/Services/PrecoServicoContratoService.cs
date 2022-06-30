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
    public class PrecoServicoContratoService : BaseService<PrecoServicoContratoDto>
    {
        private readonly BaseRepository<PrecoServicoContratoDto> _repository = new BaseRepository<PrecoServicoContratoDto>();

        public IEnumerable<PrecoServicoContratoDto> ListPrecoServicoContrato(int cod_contrato, int cod_servico, int? cod_reduzido)
        {
            var lstSqlParams = new List<SqlParameter>();
            var selectServicosContratoDto = new List<PrecoServicoContratoDto>();

            try
            {
                if (cod_contrato > 0 && cod_servico > 0) 
                {
                    lstSqlParams.Add(ParamsDefine("@Cod_Contrato", cod_contrato, SqlDbType.Int));
                    lstSqlParams.Add(ParamsDefine("@Cod_Servico", cod_servico, SqlDbType.Int));
                    lstSqlParams.Add(ParamsDefine("@Cod_Reduzido", cod_reduzido, SqlDbType.Int));

                    var myDataSet = new DataSet();
                    myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectPrecoServicoContrato, lstSqlParams);

                    var mapper = new DataNamesMapper<PrecoServicoContratoDto>();

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
