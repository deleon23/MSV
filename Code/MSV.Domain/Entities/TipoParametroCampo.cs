using System;
using System.ComponentModel.DataAnnotations;

namespace MSV.Domain.Entities
{
    public class TipoParametroCampo : BaseEntity
    {
        public int ID_TipoParametroCampo { get; set; }
        public string Des_TipoParametroCampo { get; set; }
        public DateTime? DT_INCLUSAO { get; set; }
        public DateTime? DT_ALTERACAO { get; set; }
        //public bool FLG_SITUACAO { get; set; }

    }
}
