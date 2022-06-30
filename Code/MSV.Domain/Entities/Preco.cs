using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Entities
{
    public class Preco : BaseEntity
    {
        public Preco()
        {
            precoPontoAtendimento = new PrecoPontoAtendimento();
        }

        public int COD_PRECOSEQ { get; set; }
        public int COD_PRECOORIGEM { get; set; }
        public int COD_CONTRATOREDUZIDO { get; set; }
        public int COD_SERVICO { get; set; }
        public int COD_TRIBUTACAO { get; set; }
        public int COD_SAV_ENTIDADE { get; set; }
        public int COD_SAV_ENTIDADEENDERECO { get; set; }
        public int COD_SAV_CNAB_ENTIDADEENDERECO { get; set; }
        public int COD_FAT_ENTIDADE { get; set; }
        public int COD_FAT_ENTIDADEENDERECO { get; set; }
        public int COD_FRANQUIAGRUPO { get; set; }
        public int COD_CARGAHORARIA { get; set; }
        public int COD_PRECOSTATUS { get; set; }
        public int COD_FLUXO { get; set; }
        public DateTime? DT_VIGENCIAINICIO { get; set; }
        public DateTime? DT_VIGENCIAFIM { get; set; }
        public bool FLG_CUSTODIAENTRADA { get; set; }
        public bool FLG_CUSTODIATRANSICAO { get; set; }
        public bool FLG_CUSTODIASALDO { get; set; }
        public int NOM_MEMORANDO { get; set; }
        public int DES_ENTIDADECONTRATO { get; set; }
        public bool FLG_EXECUTADONARECEPCAO { get; set; }
        public bool FLG_ELETRONICO { get; set; }
        public int COD_REGIONAL_SAVAL { get; set; }
        public int COD_FILIAL_SAVAL { get; set; }
        public int COD_REDUZIDO_SAVAL { get; set; }
        public int COD_REGIONAL_TICKET { get; set; }
        public int COD_FILIAL_TICKET { get; set; }
        public int COD_REDUZIDO_TICKET { get; set; }
        public int COD_REGIONAL_CHEQUES { get; set; }
        public int COD_FILIAL_CHEQUES { get; set; }
        public int COD_REDUZIDO_CHEQUES { get; set; }
        public decimal VL_PRECO { get; set; }
        public decimal TX_ADVALOREM { get; set; }
        public decimal TX_PERNOITE { get; set; }
        public DateTime? DT_BASE { get; set; }
        public int QT_MAOOBRA { get; set; }
        public decimal VL_FRANQUIA { get; set; }
        public decimal TX_ADPERM { get; set; }
        public decimal VL_INTERVMINUTOS { get; set; }
        public DateTime? DT_HORAADICNOTURNO { get; set; }
        public decimal PERC_ADICNOTURNO { get; set; }
        public int COD_REGIONALRATEIO { get; set; }
        public int COD_FILIALRATEIO { get; set; }
        public decimal VL_RATEIO { get; set; }
        public int COD_TIPO_VAL { get; set; }
        public int KM_DISTANCIA { get; set; }
        public decimal KM_PRECO { get; set; }
        public decimal VLR_MINIMOSERVICOAEREO { get; set; }
        public bool FLG_IMPORTACAOHISTORICO { get; set; }
        public DateTime? DT_INCLUSAO { get; set; }
        public DateTime? DT_ALTERACAO { get; set; }
        //public bool FLG_SITUACAO { get; set; }

        public PrecoPontoAtendimento precoPontoAtendimento { get; set; }
    }
}
