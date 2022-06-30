using Dapper;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MSV.Domain.Entities;
using MSV.Infra.Data.Repository;
using MSV.Infra.Data.StoredProcedure;
using MSV.Domain.MapHelperStoreProcedure;
using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using MSV.Domain.Dto.ProceduresEntities;

namespace MSV.Service.Services
{
    public class PontoAtendimentoService : BaseService<SelectPrecoDto>
    {
        private readonly BaseRepository<SelectPrecoDto> _repository = new BaseRepository<SelectPrecoDto>();

        public IEnumerable<SelectPrecoDto> List(IDictionary<string, string> filters = null)
        {
            List<SqlParameter> lstSqlParams = new List<SqlParameter>();
            List<SelectPrecoDto> selectPrecoDto = new List<SelectPrecoDto>();

            try
            {
                if (filters != null)
                {
                    if (filters.ContainsKey("cod_Contrato"))
                    {
                        
                        lstSqlParams.Add(ParamsDefine("@cod_Contrato", filters["cod_Contrato"], SqlDbType.Int));

                        if (filters.ContainsKey("cod_Reduzido"))
                            lstSqlParams.Add(ParamsDefine("@cod_Reduzido", filters["cod_Reduzido"], SqlDbType.Int));

                        var myDataSet = new DataSet();
                        myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectDadosCadPreco, lstSqlParams);

                        var mapper = new DataNamesMapper<SelectPrecoDto>();

                        selectPrecoDto = mapper.Map(myDataSet).ToList();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return selectPrecoDto;
        }
    }
}
