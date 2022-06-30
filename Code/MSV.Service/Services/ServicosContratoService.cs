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
    public class ServicosContratoService : BaseService<ServicosContratoDto>
    {
        private readonly BaseRepository<ServicosContratoDto> _repository = new BaseRepository<ServicosContratoDto>();

        public IEnumerable<ServicosContratoDto> ListServicosContrato(int cod_contrato, int? id_contratopontoatendimento = 0)
        {
            List<SqlParameter> lstSqlParams = new List<SqlParameter>();
            List<ServicosContratoDto> selectServicosContratoDto = new List<ServicosContratoDto>();

            try
            {
                if (cod_contrato > 0)
                {
                    lstSqlParams.Add(ParamsDefine("@Cod_Contrato", cod_contrato, SqlDbType.Int));

                    if (id_contratopontoatendimento > 0)
                        lstSqlParams.Add(ParamsDefine("@Cod_PontoAtendimento", id_contratopontoatendimento, SqlDbType.Int));

                    var myDataSet = new DataSet();
                    myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectServicosContrato, lstSqlParams);

                    var mapper = new DataNamesMapper<ServicosContratoDto>();

                    selectServicosContratoDto = mapper.Map(myDataSet).ToList();
                }
                else
                {
                    throw new ArgumentException("Código de contrato inválido. Favor enviar novamente.");
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
