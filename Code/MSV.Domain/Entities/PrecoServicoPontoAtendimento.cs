using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Entities
{
    public class PrecoServicoPontoAtendimento : BaseEntity
    {
        public PrecoServicoPontoAtendimento()
        {
            precoServico = new Preco();
            precoServicoPAFrequencia = new PrecoPaFrequencia();
            tipoPontoAtendimento = new TipoPontoAtendimento();
            entidadeEnderecoSAVOrigem = new Entidade();
            entidadeEnderecoSAVDestino = new Entidade();
            entidadeEnderecoFATOrigem = new Entidade();
            entidadeEnderecoFATDestino = new Entidade();
        }

               
        //[ID_PrecoServicoPontoAtendimento] [int] IDENTITY(1,1) NOT NULL,
        public int ID_PrecoServicoPontoAtendimento { get; set; }

        //[COD_PrecoServico] [int] NOT NULL,
        public Preco precoServico { get; set; }

        //[COD_EntidadeEnderecoSAVOrigem] [int] NOT NULL,
        public Entidade entidadeEnderecoSAVOrigem { get; set; }

        //[COD_EntidadeEnderecoSAVDestino] [int] NOT NULL,
        public Entidade entidadeEnderecoSAVDestino { get; set; }

        //[COD_EntidadeEnderecoFATOrigem] [int] NOT NULL,
        public Entidade entidadeEnderecoFATOrigem { get; set; }

        //[COD_EntidadeEnderecoFATDestino] [int] NOT NULL,
        public Entidade entidadeEnderecoFATDestino { get; set; }

        //[COD_PrecoServicoPAFrequencia] [int] NOT NULL,
        public PrecoPaFrequencia precoServicoPAFrequencia { get; set; }

        //[COD_TipoPontoAtendimento] [int] NOT NULL,
        public TipoPontoAtendimento tipoPontoAtendimento { get; set; }

        //[QT_MediaEmbarque] [decimal](5, 3) NULL,
        public decimal QT_MediaEmbarque { get; set; }

        //[DES_Faturamento] [varchar] (135) NULL,
        public string DES_Faturamento { get; set; }

        //[DES_Observacao] [varchar] (150) NULL,
        public string DES_Observacao { get; set; }

        //[DES_FaturamentoPrincipal] [varchar] (40) NULL,
        public string DES_FaturamentoPrincipal { get; set; }

        //[DES_FaturamentoDetalhe] [varchar] (40) NULL,
        public string DES_FaturamentoDetalhe { get; set; }

        //[DT_Inclusao] [datetime] NOT NULL,
        public DateTime? DT_Inclusao { get; set; }

        //[DT_Alteracao] [datetime] NULL,
        public DateTime? DT_Alteracao { get; set; }

        //[FLG_Situacao] [bit] NOT NULL,

        //[COD_TipoTransporte] [int] NULL,
        public TipoTransporte tipoTransporte { get; set; }

        public int FLG_PontoEntregaDireta { get; set; }

    }
}
