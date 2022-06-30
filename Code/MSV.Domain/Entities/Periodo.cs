using System;

namespace MSV.Domain.Entities
{
    public class Periodo : BaseEntity
    {
        public TimeSpan? TMP_Inicio { get; set; }
        public TimeSpan? TMP_Fim { get; set; }
    }
}
