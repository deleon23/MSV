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
    public class ParametroCampoService : BaseService<SelectParametroCampoDto>
    {
        private readonly BaseRepository<SelectParametroCampoDto> _repository = new BaseRepository<SelectParametroCampoDto>();

        public IEnumerable<SelectParametroCampoDto> List(IDictionary<string, string> filters = null)
        {
            List<SqlParameter> lstSqlParams = new List<SqlParameter>();
            List<SelectParametroCampoDto> selectParametroCampoDto = new List<SelectParametroCampoDto>();

            try
            {
                if (filters != null)
                {
                    if (filters.ContainsKey("cod_familiaproduto"))
                        lstSqlParams.Add(ParamsDefine("@COD_FamiliaProduto", filters["cod_familiaproduto"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_produto"))
                        lstSqlParams.Add(ParamsDefine("@COD_Produto", filters["cod_produto"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_servico"))
                        lstSqlParams.Add(ParamsDefine("@COD_Servico", filters["cod_servico"], SqlDbType.Int));

                    if (filters.ContainsKey("Nom_Campo"))
                        lstSqlParams.Add(ParamsDefine("@Nom_Campo", filters["Nom_Campo"], SqlDbType.VarChar));

                    if (filters.ContainsKey("Des_IdentificadorHTML"))
                        lstSqlParams.Add(ParamsDefine("@Des_IdentificadorHTML", filters["Des_IdentificadorHTML"], SqlDbType.VarChar));

                    if (filters.ContainsKey("Des_TipoParametroCampo"))
                        lstSqlParams.Add(ParamsDefine("@Des_TipoParametroCampo", filters["Des_TipoParametroCampo"], SqlDbType.VarChar));

                    var myDataSet = new DataSet();
                    myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectParametroCampo, lstSqlParams);

                    var mapper = new DataNamesMapper<SelectParametroCampoDto>();

                    selectParametroCampoDto = mapper.Map(myDataSet).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return selectParametroCampoDto;
        }
    }
}
