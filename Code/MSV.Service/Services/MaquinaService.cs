using Dapper;
using MSV.Domain.Dto;
using MSV.Domain.Entities;
using MSV.Infra.Data.Repository;
using MSV.Infra.Data.StoredProcedure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace MSV.Service.Services
{
    public class MaquinaService : BaseService<Maquina>
    {
        private readonly MaquinaRepository _repository = new MaquinaRepository();

        public Maquina GetMaquina(int id)
        {
            if (id == 0)
                throw new ArgumentException("Id não pode ser zero.");

            return _repository.SelectMaquina(id);
        }

        public IList<Maquina> GetCountMaquina(int count)
        {
            if (count == 0)
                throw new ArgumentException("Count não pode ser zero.");

            return _repository.GetCountMaquina(count);
        }

        public Maquina GetMaquinaDes(string desMaquina)
        {
            return _repository.SelectMaquinaDes(desMaquina);
        }

        public IList<Maquina> GetMaquinaPrecoDes(string desMaquina)
        {
            return _repository.SelectPrecoMaquina(desMaquina);
        }

        public IList<Maquina> GetMaquinaPrecoPontoAtendimento()
        {
            return _repository.SelectPrecoPontoMaquina();
        }

        public void ExecProcSelectAdministrativeUser(string aux, string asd)
        {
            List<DynamicParameters> lstDynamicParams = new List<DynamicParameters>();

            //lstDynamicParams.Add(ParamsDefine("@teste", aux, DbType.String, true));
            //lstDynamicParams.Add(ParamsDefine("@teste2", asd, DbType.String, true));

            ExecProc(StoredProcedures.SelectAdministrativeUser, lstDynamicParams);
        }

        public void ExecSomeProc2(string aux)
        {
            List<DynamicParameters> lstDynamicParams = new List<DynamicParameters>();

            //lstDynamicParams.Add(ParamsDefine("@teste", aux, DbType.String, true));

            ExecProc(StoredProcedures.SelectAdministrativeUser, lstDynamicParams);
        }
    }
}
