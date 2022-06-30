using System;
using System.ComponentModel.DataAnnotations;

namespace MSV.Domain.Entities
{
    public class ParametroCampo : BaseEntity
    {

        public ParametroCampo()
        {
            tipoParametroCampo = new TipoParametroCampo();
        }

        public int ID_ParametroCampo { get; set; }
        public int? COD_FamiliaProduto { get; set; }
        public int? COD_Produto { get; set; }
        public int? COD_Servico { get; set; }
        public string Nom_Campo { get; set; }
        public string Tp_Campo { get; set; }
        public string Des_IdentificadorHTML { get; set; }
        public TipoParametroCampo tipoParametroCampo { get; set; }
        public DateTime? DT_INCLUSAO { get; set; }
        public DateTime? DT_ALTERACAO { get; set; }
        //public bool FLG_SITUACAO { get; set; }

    }
}
