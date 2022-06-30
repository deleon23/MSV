using MSV.Domain.Entities;
using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Dto.ProceduresEntities
{
    public class ServicosContratoDto : BaseEntity
    {
        [DataNames("Id_Servico", "ID_Servico")]
        public int Id_Servico { get; set; }

        [DataNames("DES_CodigoInterno", "DES_CodigoInterno")]
        public string DES_CodigoInterno { get; set; }

        [DataNames("DES_Servico", "DES_Servico")]
        public string DES_Servico { get; set; }

        [DataNames("COD_FamiliaProduto", "COD_FamiliaProduto")]
        public int COD_FamiliaProduto { get; set; }

        [DataNames("Id_ContratoPontoAtendimento", "Id_ContratoPontoAtendimento")]
        public int Id_ContratoPontoAtendimento { get; set; }

        [DataNames("Cod_Contrato", "Cod_Contrato")]
        public int Cod_Contrato { get; set; }

        [DataNames("Cod_Reduzido", "Cod_Reduzido")]
        public int Cod_Reduzido { get; set; }

        [DataNames("DES_ServicoLabelResum", "DES_ServicoLabelResum")]
        public string DES_ServicoLabelResum { get; set; }

        [DataNames("DES_ServicoLabel", "DES_ServicoLabel")]
        public string DES_ServicoLabel { get; set; }
    }
}
