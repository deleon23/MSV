using MSV.Domain.Entities;
using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Dto.ProceduresEntities
{
    public class PontoAtendimentoOrigemDto : BaseEntity
    {
        [DataNames("Id_ContratoPontoAtendimento", "Id_ContratoPontoAtendimento")]
        public int Id_ContratoPontoAtendimento { get; set; }

        [DataNames("Nom_PontoAtendimento", "Nom_PontoAtendimento")]
        public string Nom_PontoAtendimento { get; set; }

        [DataNames("Nom_Cidade", "Nom_Cidade")]
        public string Nom_Cidade { get; set; }

        [DataNames("Nom_Estado", "Nom_Estado")]
        public string Nom_Estado { get; set; }

        [DataNames("Nom_Logradouro", "Nom_Logradouro")]
        public string Nom_Logradouro { get; set; }

        [DataNames("Cod_Contrato", "Cod_Contrato")]
        public int Cod_Contrato { get; set; }
    }
}
