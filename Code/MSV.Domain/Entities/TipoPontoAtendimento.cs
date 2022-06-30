using System;

namespace MSV.Domain.Entities
{
    public class TipoPontoAtendimento : BaseEntity
    {
        public string DES_TIPOPONTOATENDIMENTO { get; set; }
        public DateTime? DT_INCLUSAO { get; set; }
        public DateTime? DT_ALTERACAO { get; set; }
    }
}
