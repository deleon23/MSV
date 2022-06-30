using MSV.Domain.Entities;
using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;

namespace MSV.Domain.Dto.ProceduresEntities
{
    public class SelectPrecoServicoPontoAtendimentoDto : BaseEntity
    {
        [DataNames("ID_PrecoServicoPontoAtendimento", "ID_PrecoServicoPontoAtendimento")]
        public int? ID_PrecoServicoPontoAtendimento { get; set; }
        [DataNames("COD_PrecoServico", "COD_PrecoServico")]
        public int? COD_PrecoServico { get; set; }
        [DataNames("COD_EntidadeEnderecoSAVOrigem", "COD_EntidadeEnderecoSAVOrigem")]
        public int? COD_EntidadeEnderecoSAVOrigem { get; set; }
        [DataNames("COD_EntidadeEnderecoSAVDestino", "COD_EntidadeEnderecoSAVDestino")]
        public int? COD_EntidadeEnderecoSAVDestino { get; set; }
        [DataNames("COD_EntidadeEnderecoFATOrigem", "COD_EntidadeEnderecoFATOrigem")]
        public int? COD_EntidadeEnderecoFATOrigem { get; set; }
        [DataNames("COD_EntidadeEnderecoFATDestino", "COD_EntidadeEnderecoFATDestino")]
        public int? COD_EntidadeEnderecoFATDestino { get; set; }
        [DataNames("COD_PrecoServicoPAFrequencia", "COD_PrecoServicoPAFrequencia")]
        public int? COD_PrecoServicoPAFrequencia { get; set; }
        [DataNames("COD_TipoPontoAtendimento", "COD_TipoPontoAtendimento")]
        public int? COD_TipoPontoAtendimento { get; set; }
        [DataNames("QT_MediaEmbarque", "QT_MediaEmbarque")]
        public decimal QT_MediaEmbarque { get; set; }
        [DataNames("DES_Faturamento", "DES_Faturamento")]
        public string DES_Faturamento { get; set; }
        [DataNames("DES_Observacao", "DES_Observacao")]
        public string DES_Observacao { get; set; }
        [DataNames("DES_FaturamentoPrincipal", "DES_FaturamentoPrincipal")]
        public string DES_FaturamentoPrincipal { get; set; }
        [DataNames("DES_FaturamentoDetalhe", "DES_FaturamentoDetalhe")]
        public string DES_FaturamentoDetalhe { get; set; }
        [DataNames("DT_Inclusao", "DT_Inclusao")]
        public DateTime? DT_Inclusao { get; set; }
        [DataNames("DT_Alteracao", "DT_Alteracao")]
        public DateTime DT_Alteracao { get; set; }
        [DataNames("COD_TipoTransporte", "COD_TipoTransporte")]
        public int COD_TipoTransporte { get; set; }
        [DataNames("DES_TipoTransporte", "DES_TipoTransporte")]
        public string DES_TipoTransporte { get; set; }
        [DataNames("DES_TIPOPONTOATENDIMENTO", "DES_TIPOPONTOATENDIMENTO")]
        public string DES_TIPOPONTOATENDIMENTO { get; set; }
        [DataNames("FLG_PontoEntregaDireta", "FLG_PontoEntregaDireta")]
        public int FLG_PontoEntregaDireta { get; set; }
    }
}
