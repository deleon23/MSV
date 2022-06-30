using MSV.Domain.Entities;
using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Dto.ProceduresEntities
{
    public class SelectParametroCampoDto : BaseEntity
    {

        [DataNames("ID_ParametroCampo", "ID_ParametroCampo")]
        public int ID_ParametroCampo { get; set; }

        [DataNames("COD_Produto", "COD_Produto")]
        public int COD_Produto { get; set; }

        [DataNames("COD_Servico", "COD_Servico")]
        public int COD_Servico { get; set; }

        [DataNames("Nom_Campo", "Nom_Campo")]
        public string Nom_Campo { get; set; }

        [DataNames("Tp_Campo", "Tp_Campo")]
        public string Tp_Campo { get; set; }

        [DataNames("Des_IdentificadorHTML", "Des_IdentificadorHTML")]
        public string Des_IdentificadorHTML { get; set; }

        [DataNames("ID_TipoParametroCampo", "ID_TipoParametroCampo")]
        public int ID_TipoParametroCampo { get; set; }

        [DataNames("Des_TipoParametroCampo", "Des_TipoParametroCampo")]
        public string Des_TipoParametroCampo { get; set; }

        [DataNames("COD_FamiliaProduto", "COD_FamiliaProduto")]
        public int COD_FamiliaProduto { get; set; }
        

    }
}
