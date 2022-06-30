using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Entities
{
    public class PrecoPontoAtendimento : BaseEntity
    {
        public PrecoPontoAtendimento()
        {
            precoPaFrequencias = new List<PrecoPaFrequencia>();
        }

        public int COD_PRECO { get; set; }

        public int COD_PRECOPAFREQUENCIA { get; set; }

        public int COD_TIPOPONTOATENDIMENTO { get; set; }

        public DateTime DT_INCLUSAO { get; set; }

        //public bool FLG_SITUACAO { get; set; }

        public List<PrecoPaFrequencia> precoPaFrequencias { get; set; }
    }
}
