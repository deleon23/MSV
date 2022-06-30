using MSV.Domain.Entities;
using MSV.Infra.Data.Context;
using System;
using System.Collections.Generic;
using System.Linq;

namespace MSV.Infra.Data.Repository
{
    public class PrecoPaFrequenciaRepository : BaseRepository<PrecoPaFrequencia>
    {
        private readonly SqlContext _context = new SqlContext();

        public List<PrecoPaFrequencia> SelectPrecoPaFrequencia(int cod_contratoReduzido, int cod_servico)
        {
            try
            {

                #if (DEBUG)
                var query = (from precoPaFrequencia in _context.PrecoPaFrequencia
                             join ppa in _context.PrecoPontoAtendimento on precoPaFrequencia.Id equals ppa.COD_PRECOPAFREQUENCIA into precoPontoAtendimentoResult
                             from precoPontoAtendimento in precoPontoAtendimentoResult.DefaultIfEmpty()
                             join p in _context.Preco on precoPontoAtendimento.COD_PRECO equals p.Id into precoResult
                             from preco in precoResult.DefaultIfEmpty()
                             join f in _context.Frequencia on precoPaFrequencia.COD_FREQUENCIA equals f.Id into frequenciaResult
                             from frequencia in frequenciaResult.DefaultIfEmpty()
                             join f in _context.Feriado on precoPaFrequencia.COD_FERIADO equals f.Id into feriadoResult
                             from feriado in feriadoResult.DefaultIfEmpty()
                             join f in _context.TipoFeriado on feriado.COD_TipoFeriado equals f.Id into tipoFeriadoResult
                             from tipoFeriado in tipoFeriadoResult.DefaultIfEmpty()
                             join pr in _context.PeriodoRecolhimento on precoPaFrequencia.COD_PERIODORECOLHIMENTO equals pr.Id into periodoRecolhimentoResult
                             from periodoRecolhimento in periodoRecolhimentoResult.DefaultIfEmpty()
                             join ps in _context.PeriodoSuprimento on precoPaFrequencia.COD_PERIODOSUPRIMENTO equals ps.Id into periodoSuprimentoResult
                             from periodoSuprimento in periodoSuprimentoResult.DefaultIfEmpty()
                             join ppr in _context.Periodo on periodoRecolhimento.COD_Periodo equals ppr.Id into horarioPeriodoRecolhimentoResult
                             from horarioPeriodoRecolhimento in horarioPeriodoRecolhimentoResult.DefaultIfEmpty()
                             join pps in _context.Periodo on periodoSuprimento.COD_Periodo equals pps.Id into horarioPeriodoSuprimentoResult
                             from horarioPeriodoSuprimento in horarioPeriodoSuprimentoResult.DefaultIfEmpty()
                             join pps in _context.Periodo on feriado.COD_Periodo equals pps.Id into horarioPeriodoFeriadoResult
                             from horarioPeriodoFeriado in horarioPeriodoFeriadoResult.DefaultIfEmpty()
                             where preco.COD_CONTRATOREDUZIDO == cod_contratoReduzido && preco.COD_SERVICO == cod_servico
                             select new PrecoPaFrequencia
                             {
                                 COD_FERIADO = precoPaFrequencia.COD_FERIADO,
                                 COD_FREQUENCIA = precoPaFrequencia.COD_FREQUENCIA,
                                 COD_PERIODORECOLHIMENTO = precoPaFrequencia.COD_PERIODORECOLHIMENTO,
                                 COD_PERIODOSUPRIMENTO = precoPaFrequencia.COD_PERIODOSUPRIMENTO,
                                 COD_PROPOSTATIPOPROPOSTASERVICO = precoPaFrequencia.COD_PROPOSTATIPOPROPOSTASERVICO,
                                 DT_ALTERACAO = precoPaFrequencia.DT_ALTERACAO,
                                 DT_INCLUSAO = precoPaFrequencia.DT_INCLUSAO,
                                 Flg_Situacao = precoPaFrequencia.Flg_Situacao,
                                 Id = precoPaFrequencia.Id,
                                 Frequencia = new Frequencia
                                 {
                                     Id = frequencia.Id,
                                     DES_Quinzena = frequencia.DES_Quinzena,
                                     DES_DiasSemana = frequencia.DES_DiasSemana,
                                     DES_SemanaMes = frequencia.DES_SemanaMes,
                                     DES_DiasUteis = frequencia.DES_DiasUteis,
                                     //DES_DiasMes = frequencia.DES_DiasMes,
                                     DES_Cronograma = frequencia.DES_Cronograma,
                                     Flg_Situacao = frequencia.Flg_Situacao
                                 },
                                 Feriado = new Feriado
                                 {
                                     Id = feriado.Id,
                                     COD_Periodo = feriado.COD_Periodo,
                                     COD_TipoFeriado = feriado.COD_TipoFeriado,
                                     Flg_Situacao = feriado.Flg_Situacao,
                                     Periodo = new Periodo
                                     {
                                         Id = horarioPeriodoFeriado.Id,
                                         TMP_Inicio = horarioPeriodoFeriado.TMP_Inicio,
                                         TMP_Fim = horarioPeriodoFeriado.TMP_Fim,
                                         Flg_Situacao = horarioPeriodoFeriado.Flg_Situacao
                                     },
                                     TipoFeriado = new TipoFeriado
                                     {
                                         Id = tipoFeriado.Id,
                                         Nom_TipoFeriado = tipoFeriado.Nom_TipoFeriado,
                                         Des_TipoFeriado = tipoFeriado.Des_TipoFeriado,
                                         Flg_Situacao = tipoFeriado.Flg_Situacao
                                     }
                                 },
                                 PeriodoRecolhimento = new PeriodoRecolhimento
                                 {
                                     Id = periodoRecolhimento.Id,
                                     COD_Periodo = periodoRecolhimento.COD_Periodo,
                                     Flg_Situacao = periodoRecolhimento.Flg_Situacao,
                                     Periodo = new Periodo
                                     {
                                         Id = horarioPeriodoRecolhimento.Id,
                                         TMP_Inicio = horarioPeriodoRecolhimento.TMP_Inicio,
                                         TMP_Fim = horarioPeriodoRecolhimento.TMP_Fim,
                                         Flg_Situacao = horarioPeriodoRecolhimento.Flg_Situacao
                                     }
                                 },
                                 PeriodoSuprimento = new PeriodoSuprimento
                                 {
                                     Id = periodoSuprimento.Id,
                                     COD_Periodo = periodoSuprimento.COD_Periodo,
                                     Flg_Situacao = periodoSuprimento.Flg_Situacao,
                                     Periodo = new Periodo
                                     {
                                         Id = horarioPeriodoSuprimento.Id,
                                         TMP_Inicio = horarioPeriodoSuprimento.TMP_Inicio,
                                         TMP_Fim = horarioPeriodoSuprimento.TMP_Fim,
                                         Flg_Situacao = horarioPeriodoSuprimento.Flg_Situacao
                                     }
                                 }
                             }).ToSql();
                #endif

                return (from precoPaFrequencia in _context.PrecoPaFrequencia
                        join ppa in _context.PrecoPontoAtendimento on precoPaFrequencia.Id equals ppa.COD_PRECOPAFREQUENCIA into precoPontoAtendimentoResult
                        from precoPontoAtendimento in precoPontoAtendimentoResult.DefaultIfEmpty()
                        join p in _context.Preco on precoPontoAtendimento.COD_PRECO equals p.Id into precoResult
                        from preco in precoResult.DefaultIfEmpty()
                        join f in _context.Frequencia on precoPaFrequencia.COD_FREQUENCIA equals f.Id into frequenciaResult
                        from frequencia in frequenciaResult.DefaultIfEmpty()
                        join f in _context.Feriado on precoPaFrequencia.COD_FERIADO equals f.Id into feriadoResult
                        from feriado in feriadoResult.DefaultIfEmpty()
                        join f in _context.TipoFeriado on feriado.COD_TipoFeriado equals f.Id into tipoFeriadoResult
                        from tipoFeriado in tipoFeriadoResult.DefaultIfEmpty()
                        join pr in _context.PeriodoRecolhimento on precoPaFrequencia.COD_PERIODORECOLHIMENTO equals pr.Id into periodoRecolhimentoResult
                        from periodoRecolhimento in periodoRecolhimentoResult.DefaultIfEmpty()
                        join ps in _context.PeriodoSuprimento on precoPaFrequencia.COD_PERIODOSUPRIMENTO equals ps.Id into periodoSuprimentoResult
                        from periodoSuprimento in periodoSuprimentoResult.DefaultIfEmpty()
                        join ppr in _context.Periodo on periodoRecolhimento.COD_Periodo equals ppr.Id into horarioPeriodoRecolhimentoResult
                        from horarioPeriodoRecolhimento in horarioPeriodoRecolhimentoResult.DefaultIfEmpty()
                        join pps in _context.Periodo on periodoSuprimento.COD_Periodo equals pps.Id into horarioPeriodoSuprimentoResult
                        from horarioPeriodoSuprimento in horarioPeriodoSuprimentoResult.DefaultIfEmpty()
                        join pps in _context.Periodo on feriado.COD_Periodo equals pps.Id into horarioPeriodoFeriadoResult
                        from horarioPeriodoFeriado in horarioPeriodoFeriadoResult.DefaultIfEmpty()
                        where preco.COD_CONTRATOREDUZIDO == cod_contratoReduzido && preco.COD_SERVICO == cod_servico
                        select new PrecoPaFrequencia
                        {
                            COD_FERIADO = precoPaFrequencia.COD_FERIADO,
                            COD_FREQUENCIA = precoPaFrequencia.COD_FREQUENCIA,
                            COD_PERIODORECOLHIMENTO = precoPaFrequencia.COD_PERIODORECOLHIMENTO,
                            COD_PERIODOSUPRIMENTO = precoPaFrequencia.COD_PERIODOSUPRIMENTO,
                            COD_PROPOSTATIPOPROPOSTASERVICO = precoPaFrequencia.COD_PROPOSTATIPOPROPOSTASERVICO,
                            DT_ALTERACAO = precoPaFrequencia.DT_ALTERACAO,
                            DT_INCLUSAO = precoPaFrequencia.DT_INCLUSAO,
                            Flg_Situacao = precoPaFrequencia.Flg_Situacao,
                            Id = precoPaFrequencia.Id,
                            Frequencia = new Frequencia
                            {
                                Id = frequencia.Id,
                                DES_Quinzena = frequencia.DES_Quinzena,
                                DES_DiasSemana = frequencia.DES_DiasSemana,
                                DES_SemanaMes = frequencia.DES_SemanaMes,
                                DES_DiasUteis = frequencia.DES_DiasUteis,
                                //DES_DiasMes = frequencia.DES_DiasMes,
                                DES_Cronograma = frequencia.DES_Cronograma,
                                Flg_Situacao = frequencia.Flg_Situacao
                            },
                            Feriado = new Feriado
                            {
                                Id = feriado.Id,
                                COD_Periodo = feriado.COD_Periodo,
                                COD_TipoFeriado = feriado.COD_TipoFeriado,
                                Flg_Situacao = feriado.Flg_Situacao,
                                Periodo = new Periodo
                                {
                                    Id = horarioPeriodoFeriado.Id,
                                    TMP_Inicio = horarioPeriodoFeriado.TMP_Inicio,
                                    TMP_Fim = horarioPeriodoFeriado.TMP_Fim,
                                    Flg_Situacao = horarioPeriodoFeriado.Flg_Situacao
                                },
                                TipoFeriado = new TipoFeriado
                                {
                                    Id = tipoFeriado.Id,
                                    Nom_TipoFeriado = tipoFeriado.Nom_TipoFeriado,
                                    Des_TipoFeriado = tipoFeriado.Des_TipoFeriado,
                                    Flg_Situacao = tipoFeriado.Flg_Situacao
                                }
                            },
                            PeriodoRecolhimento = new PeriodoRecolhimento
                            {
                                Id = periodoRecolhimento.Id,
                                COD_Periodo = periodoRecolhimento.COD_Periodo,
                                Flg_Situacao = periodoRecolhimento.Flg_Situacao,
                                Periodo = new Periodo
                                {
                                    Id = horarioPeriodoRecolhimento.Id,
                                    TMP_Inicio = horarioPeriodoRecolhimento.TMP_Inicio,
                                    TMP_Fim = horarioPeriodoRecolhimento.TMP_Fim,
                                    Flg_Situacao = horarioPeriodoRecolhimento.Flg_Situacao
                                }
                            },
                            PeriodoSuprimento = new PeriodoSuprimento
                            {
                                Id = periodoSuprimento.Id,
                                COD_Periodo = periodoSuprimento.COD_Periodo,
                                Flg_Situacao = periodoSuprimento.Flg_Situacao,
                                Periodo = new Periodo
                                {
                                    Id = horarioPeriodoSuprimento.Id,
                                    TMP_Inicio = horarioPeriodoSuprimento.TMP_Inicio,
                                    TMP_Fim = horarioPeriodoSuprimento.TMP_Fim,
                                    Flg_Situacao = horarioPeriodoSuprimento.Flg_Situacao
                                }
                            }
                        }).ToList();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
