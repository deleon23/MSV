using System;

namespace MSV.Domain.Entities
{
    public class FluxoOperacional : BaseEntity
    {
        public string Descricao { get; set; }
        public DateTime? Dt_Inclusao { get; set; }
        public DateTime? Dt_Alteracao { get; set; }
    }
}
