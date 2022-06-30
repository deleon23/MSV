using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Entities
{
    public class Frequencia : BaseEntity
    {
        public string DES_Quinzena { get; set; }
        public string DES_DiasSemana { get; set; }
        public string DES_SemanaMes { get; set; }
        //public string DES_DiasMes { get; set; }
        public string DES_DiasUteis { get; set; }
        public string DES_Cronograma { get; set; }
    }
}
