using System;

namespace MSV.Domain.Entities
{
    public class PrecoPaFrequencia : BaseEntity
    {
        public PrecoPaFrequencia()
        {
            Frequencia = new Frequencia();
            Feriado = new Feriado();
            PeriodoRecolhimento = new PeriodoRecolhimento();
            PeriodoSuprimento = new PeriodoSuprimento();
        }
        public int COD_PROPOSTATIPOPROPOSTASERVICO { get; set; }
        public int COD_FREQUENCIA { get; set; }
        public Frequencia Frequencia { get; set; }
        public int COD_FERIADO { get; set; }
        public Feriado Feriado { get; set; }
        public int COD_PERIODORECOLHIMENTO { get; set; }
        public PeriodoRecolhimento PeriodoRecolhimento { get; set; }
        public int COD_PERIODOSUPRIMENTO { get; set; }
        public PeriodoSuprimento PeriodoSuprimento { get; set; }
        public DateTime? DT_INCLUSAO { get; set; }
        public DateTime? DT_ALTERACAO { get; set; }
        //public bool FLG_SITUACAO { get; set; }
    }
}
