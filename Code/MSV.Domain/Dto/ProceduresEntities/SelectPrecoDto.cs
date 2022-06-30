using MSV.Domain.Entities;
using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Dto.ProceduresEntities
{
    public class SelectPrecoDto : BaseEntity
    {
        //------ cli 
        [DataNames("Cli_RazaoSocial", "Cli_RazaoSocial")]
        public string Cli_RazaoSocial { get; set; }

        [DataNames("Cli_Cnpj", "Cli_Cnpj")]
        public string Cli_Cnpj { get; set; }

        [DataNames("Nom_Abvd_Filial", "Nom_Abvd_Filial")]
        public string Nom_Abvd_Filial { get; set; }

        [DataNames("Banco", "Banco")]
        public string Banco { get; set; }

        [DataNames("Cod_Agencia", "Cod_Agencia")]
        public string Cod_Agencia { get; set; }

        [DataNames("Cod_Conta", "Cod_Conta")]
        public string Cod_Conta { get; set; }

        //,1 as Modalidade -- TODO
        [DataNames("Modalidade", "Modalidade")]
        public string Modalidade { get; set; }

        [DataNames("DT_VigenciaContrato", "DT_VigenciaContrato")]
        public string DT_VigenciaContrato { get; set; }

        [DataNames("Responsavel", "Responsavel")]
        public string Responsavel { get; set; }

        [DataNames("Cod_Contrato", "Cod_Contrato")]
        public int Cod_Contrato { get; set; }

        //------ subcli
        [DataNames("SubCli_RazaoSocial", "SubCli_RazaoSocial")]
        public string SubCli_RazaoSocial { get; set; }

        [DataNames("PontoOperacional", "PontoOperacional")]
        public string PontoOperacional { get; set; }

        [DataNames("SubCli_Cnpj", "SubCli_Cnpj")]
        public string SubCli_Cnpj { get; set; }

        [DataNames("Cod_Reduzido", "Cod_Reduzido")]
        public int Cod_Reduzido { get; set; }

        [DataNames("Id_ContratoPontoAtendimento", "Id_ContratoPontoAtendimento")]
        public string Id_ContratoPontoAtendimento { get; set; }

        [DataNames("Des_FamiliaServico", "Des_FamiliaServico")]
        public string Des_FamiliaServico { get; set; }
        
        [DataNames("Cod_Banco", "Cod_Banco")]
        public string Cod_Banco { get; set; }

        [DataNames("Nom_Banco", "Nom_Banco")]
        public string Nom_Banco { get; set; }

        [DataNames("NOM_MEMORANDO", "NOM_MEMORANDO")]
        public string NOM_MEMORANDO { get; set; }
        



    }
}
