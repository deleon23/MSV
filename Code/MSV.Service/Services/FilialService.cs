using MSV.Domain.Entities;
using MSV.Infra.Data.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Service.Services
{
    public class FilialService : BaseService<Filial>
    {
        private readonly FilialRepository _repository = new FilialRepository();

        public IList<Filial> GetFilialByEmpresa(int codEmpresa)
        {
            if (codEmpresa == 0)
                throw new ArgumentException("Código Empresa não pode ser zero.");

            return _repository.GetFilialByEmpresa(codEmpresa);
        }
    }
}
