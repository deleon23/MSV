using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Entities
{
    public class TipoTransporte : BaseEntity
    {
        //[ID_TipoTransporte] [int] IDENTITY(1,1) NOT NULL,
        public int ID_TipoTransporte { get; set; }

        //[DES_TipoTransporte] [varchar] (50) NOT NULL,
        public string DES_TipoTransporte { get; set; }

        public DateTime? DT_INCLUSAO { get; set; }
        public DateTime? DT_ALTERACAO { get; set; }
        //public bool FLG_SITUACAO { get; set; }

    }
}
