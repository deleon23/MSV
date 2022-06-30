using MSV.Domain.Entities;
using MSV.Domain.MapHelperStoreProcedure;
using MSV.Infra.Data.Repository;
using MSV.Infra.Data.StoredProcedure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace MSV.Service.Services
{
    public class UserService : BaseService<UserDto>
    {
        private readonly BaseRepository<UserDto> _repository = new BaseRepository<UserDto>();

        public IEnumerable<UserDto> List(string login)
        {
            List<SqlParameter> lstSqlParams = new List<SqlParameter>();
            List<UserDto> selectPrecoDto = new List<UserDto>();

            try
            {
                lstSqlParams.Add(ParamsDefine("@Nom_Usuario", login, SqlDbType.VarChar));

                var myDataSet = new DataSet();
                myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectControleAcesso, lstSqlParams);

                var mapper = new DataNamesMapper<UserDto>();

                selectPrecoDto = mapper.Map(myDataSet).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return selectPrecoDto;
        }

        public bool UserExists(string login)
        {
            return List(login).Count() > 0? true : false;
        }
    }
}
