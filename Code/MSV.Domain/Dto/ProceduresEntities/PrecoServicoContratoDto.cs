using MSV.Domain.Entities;
using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;

namespace MSV.Domain.Dto.ProceduresEntities
{
    public class PrecoServicoContratoDto : BaseEntity
    {

        //Informações de Clientes - Modulos Serviços
        [DataNames("Cliente", "Cliente")]
        public string Cliente { get; set; }

        [DataNames("SubCliente", "SubCliente")]
        public string SubCliente { get; set; }

        [DataNames("Matriz", "Matriz")]
        public string Matriz { get; set; }

        [DataNames("Cliente_Fat", "Cliente_Fat")]
        public string Cliente_Fat { get; set; }

        [DataNames("Cliente_Fat_SubCliente", "Cliente_Fat_SubCliente")]
        public string Cliente_Fat_SubCliente { get; set; }

        //Serviços
        [DataNames("Des_Composicao", "Des_Composicao")]
        public string Des_Composicao { get; set; }

        [DataNames("NOM_Produto", "NOM_Produto")]
        public string NOM_Produto { get; set; }

        [DataNames("DES_CodigoInterno", "DES_CodigoInterno")]
        public string DES_CodigoInterno { get; set; }

        [DataNames("FLG_SITUACAO", "FLG_SITUACAO")]
        public bool FLG_SITUACAO { get; set; }

        [DataNames("DT_VIGENCIAINICIO", "DT_VIGENCIAINICIO")]
        public DateTime DT_VIGENCIAINICIO { get; set; }

        [DataNames("DT_VIGENCIAFIM", "DT_VIGENCIAFIM")]
        public DateTime DT_VIGENCIAFIM { get; set; }

        [DataNames("DT_BASE", "DT_BASE")]
        public DateTime DT_BASE { get; set; }

        [DataNames("Nom_Abvd_Filial", "Nom_Abvd_Filial")]
        public string Nom_Abvd_Filial { get; set; }

        [DataNames("COD_FLUXO", "COD_FLUXO")]
        public int COD_FLUXO { get; set; }

        //Valores
        [DataNames("VL_PRECO", "VL_PRECO")]
        public decimal VL_PRECO { get; set; }

        [DataNames("TX_ADVALOREM", "TX_ADVALOREM")]
        public decimal TX_ADVALOREM { get; set; }

        [DataNames("TX_PERNOITE", "TX_PERNOITE")]
        public decimal TX_PERNOITE { get; set; }

        [DataNames("VL_FRANQUIA", "VL_FRANQUIA")]
        public decimal VL_FRANQUIA { get; set; }

        [DataNames("TX_ADPERM", "TX_ADPERM")]
        public decimal TX_ADPERM { get; set; }

        [DataNames("VL_INTERVMINUTOS", "VL_INTERVMINUTOS")]
        public decimal VL_INTERVMINUTOS { get; set; }

        [DataNames("PERC_ADICNOTURNO", "PERC_ADICNOTURNO")]
        public decimal PERC_ADICNOTURNO { get; set; }

        //Complementar para aplicação
        [DataNames("COD_CONTRATOREDUZIDO", "COD_CONTRATOREDUZIDO")]
        public int COD_CONTRATOREDUZIDO { get; set; }

        //para carregamento de ParametroCampo
        [DataNames("COD_FamiliaProduto", "COD_FamiliaProduto")]
        public int COD_FamiliaProduto { get; set; }

        [DataNames("COD_Produto", "COD_Produto")]
        public int COD_Produto { get; set; }

        [DataNames("COD_Servico", "COD_Servico")]
        public int COD_Servico { get; set; }
    }
}
