using MSV.Domain.Dto.ProceduresEntities;
using MSV.Domain.Entities;
using MSV.Domain.MapHelperStoreProcedure;
using MSV.Infra.Data.Repository;
using MSV.Infra.Data.StoredProcedure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace MSV.Service.Services
{
    public class ContratoSubClienteService : BaseService<BaseEntity>
    {
        private readonly ContratoSubClienteRepository _repository = new ContratoSubClienteRepository();

        public IEnumerable<SelectContratosSubClientesDto> List(IDictionary<string, string> filters = null)
        {
            var lstSqlParams = new List<SqlParameter>();
            var selectContratosSubClientesDto = new List<SelectContratosSubClientesDto>();

            try
            {
                if (filters != null)
                {
                    if (filters.ContainsKey("cod_Empresa"))
                        lstSqlParams.Add(ParamsDefine("@Cod_Empresa", filters["cod_Empresa"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_Regional"))
                        lstSqlParams.Add(ParamsDefine("@Cod_Regional", filters["cod_Regional"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_Filial"))
                        lstSqlParams.Add(ParamsDefine("@Cod_Filial", filters["cod_Filial"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_Reduzido"))
                        lstSqlParams.Add(ParamsDefine("@Cod_Reduzido", filters["cod_Reduzido"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_ClienteEntidade"))
                        lstSqlParams.Add(ParamsDefine("@Cod_ClienteEntidade", filters["cod_ClienteEntidade"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_SubClienteEntidade"))
                        lstSqlParams.Add(ParamsDefine("@Cod_SubClienteEntidade", filters["cod_SubClienteEntidade"], SqlDbType.Int));

                    if (filters.ContainsKey("des_Aditivo"))
                        lstSqlParams.Add(ParamsDefine("@Des_Aditivo", filters["des_Aditivo"], SqlDbType.VarChar));

                    if (filters.ContainsKey("cod_TipoSubCliente"))
                        lstSqlParams.Add(ParamsDefine("@Cod_TipoSubCliente", filters["cod_TipoSubCliente"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_Familia"))
                        lstSqlParams.Add(ParamsDefine("@Cod_Familia", filters["cod_Familia"], SqlDbType.Int));

                    if (filters.ContainsKey("cod_Contrato"))
                        lstSqlParams.Add(ParamsDefine("@Cod_Contrato", filters["cod_Contrato"], SqlDbType.Int));

                    if (filters.ContainsKey("flg_ExibeInativos"))
                        lstSqlParams.Add(ParamsDefine("@FLG_ExibeInativos", filters["flg_ExibeInativos"], SqlDbType.Bit));

                    lstSqlParams.Add(ParamsDefine("@CampoOrdenacao", filters["campoOrdenacao"], SqlDbType.VarChar));
                    lstSqlParams.Add(ParamsDefine("@TamanhoPagina", filters["tamanhoPagina"], SqlDbType.SmallInt));
                    lstSqlParams.Add(ParamsDefine("@PaginaAtual", filters["paginaAtual"], SqlDbType.Int));

                    var myDataSet = new DataSet();
                    myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectContratosSubClientes, lstSqlParams);

                    var mapper = new DataNamesMapper<SelectContratosSubClientesDto>();

                    selectContratosSubClientesDto = mapper.Map(myDataSet).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return selectContratosSubClientesDto;
        }
    }
}
