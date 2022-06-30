using MSV.Domain.Dto;
using MSV.Domain.Entities;
using MSV.Infra.Data.Context;
using System.Collections.Generic;
using System.Linq;

namespace MSV.Infra.Data.Repository
{
    public class MaquinaRepository : BaseRepository<Maquina>
    {
        private readonly SqlContext _context = new SqlContext();

        public Maquina SelectMaquina(int id)
        {
            return _context.Maquina.Where(c => c.Id == id).FirstOrDefault();
        }

        public Maquina SelectMaquinaDes(string desMaquina)
        {
            return _context.Maquina.Where(c => c.Des_Maquina.Contains(desMaquina)).FirstOrDefault();
        }

        public IList<Maquina> GetCountMaquina(int count)
        {
            return _context.Maquina.Take(count).ToList();
        }

        public IList<Maquina> SelectPrecoMaquina(string desMaquina)
        {
            return (from m in _context.Maquina
                    join pm in _context.PrecoMaquina on m.Id equals pm.COD_MAQUINA
                    select new Maquina()
                    {
                        Id = m.Id,
                        Des_Maquina = m.Des_Maquina,
                        Nr_Serie = m.Nr_Serie,
                        Flg_Situacao = m.Flg_Situacao,
                        precoMaquina = new PrecoMaquina()
                        {
                            COD_MAQUINA = pm.COD_MAQUINA,
                            COD_PRECOPONTOATENDIMENTO = pm.COD_PRECOPONTOATENDIMENTO,
                            DT_INCLUSAO = pm.DT_INCLUSAO,
                            Flg_Situacao = pm.Flg_Situacao
                        }
                    }
             ).ToList();
        }

        public IList<Maquina> SelectPrecoPontoMaquina()
        {
            return (from m in _context.Maquina
                    join pm in _context.PrecoMaquina on m.Id equals pm.COD_MAQUINA
                    join ppa in _context.PrecoPontoAtendimento on pm.COD_PRECOPONTOATENDIMENTO equals ppa.Id
                    select new Maquina()
                    {
                        Id = m.Id,
                        Des_Maquina = m.Des_Maquina,
                        Nr_Serie = m.Nr_Serie,
                        Flg_Situacao = m.Flg_Situacao,
                        precoMaquina = new PrecoMaquina()
                        {
                            Id = pm.Id,
                            COD_MAQUINA = pm.COD_MAQUINA,
                            COD_PRECOPONTOATENDIMENTO = pm.COD_PRECOPONTOATENDIMENTO,
                            DT_INCLUSAO = pm.DT_INCLUSAO,
                            Flg_Situacao = pm.Flg_Situacao,
                            precoPontoAtendimento = new PrecoPontoAtendimento()
                            {
                                Id = ppa.Id,
                                COD_PRECO = ppa.COD_PRECO,
                                COD_PRECOPAFREQUENCIA = ppa.COD_PRECOPAFREQUENCIA,
                                COD_TIPOPONTOATENDIMENTO = ppa.COD_TIPOPONTOATENDIMENTO,
                                DT_INCLUSAO = ppa.DT_INCLUSAO,
                                Flg_Situacao = ppa.Flg_Situacao
                            }
                        }
                    }).ToList();
        }
    }
}
