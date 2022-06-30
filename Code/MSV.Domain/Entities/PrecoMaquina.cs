using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Entities
{
    public class PrecoMaquina : BaseEntity
    {
        public PrecoMaquina()
        {
            precoPontoAtendimento = new PrecoPontoAtendimento();
        }

        public int COD_PRECOPONTOATENDIMENTO { get; set; }

        public int COD_MAQUINA { get; set; }

        public DateTime DT_INCLUSAO { get; set; }

        //public bool FLG_SITUACAO { get; set; }

        public PrecoPontoAtendimento precoPontoAtendimento { get; set; }
    }
}
