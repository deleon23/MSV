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
    public class EntidadeService : BaseService<Entidade>
    {
        private readonly EntidadeRepository _repository = new EntidadeRepository();

        public IEnumerable<SelectEntidades> GetSubclienteByClient(int codEntidade)
        {
            var lstSqlParams = new List<SqlParameter>();
            var entidades = new List<SelectEntidades>();

            try
            {
                lstSqlParams.Add(ParamsDefine("@Cod_Entidade", codEntidade, SqlDbType.Int));

                var myDataSet = new DataSet();
                myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectSubClientesPorCliente, lstSqlParams);

                var mapper = new DataNamesMapper<SelectEntidades>();

                entidades = mapper.Map(myDataSet).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return entidades;
        }

        public IEnumerable<SelectEntidades> GetClientes()
        {
            var lstSqlParams = new List<SqlParameter>();
            var entidades = new List<SelectEntidades>();

            try
            {
                var myDataSet = new DataSet();
                myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectClientes, lstSqlParams);

                var mapper = new DataNamesMapper<SelectEntidades>();

                entidades = mapper.Map(myDataSet).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return entidades;
        }

        public IEnumerable<SelectEntidades> GetSubClientes()
        {
            var lstSqlParams = new List<SqlParameter>();
            var entidades = new List<SelectEntidades>();

            try
            {
                var myDataSet = new DataSet();
                myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectSubClientesPorCliente, lstSqlParams);

                var mapper = new DataNamesMapper<SelectEntidades>();

                entidades = mapper.Map(myDataSet).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return entidades;
        }
    }
}
