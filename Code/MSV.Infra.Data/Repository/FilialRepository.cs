using MSV.Domain.Entities;
using MSV.Infra.Data.Context;
using System.Collections.Generic;
using System.Linq;

namespace MSV.Infra.Data.Repository
{
    public class FilialRepository : BaseRepository<Filial>
    {
        private readonly SqlContext _context = new SqlContext();

        public IList<Filial> GetFilialByEmpresa(int codEmpresa)
        {
            return _context.Filial.Where(f => f.Cod_Empresa == codEmpresa).ToList();
        }
    }
}
