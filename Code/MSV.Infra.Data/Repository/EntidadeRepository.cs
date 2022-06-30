using MSV.Domain.Entities;
using MSV.Infra.Data.Context;
using System.Collections.Generic;
using System.Linq;

namespace MSV.Infra.Data.Repository
{
    public class EntidadeRepository : BaseRepository<Entidade>
    {
        private readonly SqlContext _context = new SqlContext();

        public IList<Entidade> GetCountEntidade(int count)
        {
            return _context.Entidade.Take(count).ToList();
        }
    }
}
