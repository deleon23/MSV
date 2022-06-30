using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Infra.Data.Mapping
{
    public class PrecoServicoPontoAtendimentoMap : IEntityTypeConfiguration<PrecoServicoPontoAtendimento>
    {
        public void Configure(EntityTypeBuilder<PrecoServicoPontoAtendimento> builder)
        {

            builder.ToTable("MSV_PrecoServicoPontoAtendimento");

            builder.Property(c => c.ID_PrecoServicoPontoAtendimento).IsRequired().HasColumnName("ID_PrecoServicoPontoAtendimento");
            builder.Property(c => c.precoServico).IsRequired().HasColumnName("COD_PrecoServico");
            builder.Property(c => c.entidadeEnderecoSAVOrigem).IsRequired().HasColumnName("COD_EntidadeEnderecoSAVOrigem");
            builder.Property(c => c.entidadeEnderecoSAVDestino).IsRequired().HasColumnName("COD_EntidadeEnderecoSAVDestino");
            builder.Property(c => c.entidadeEnderecoFATOrigem).IsRequired().HasColumnName("COD_EntidadeEnderecoFATOrigem");
            builder.Property(c => c.entidadeEnderecoFATDestino).IsRequired().HasColumnName("COD_EntidadeEnderecoFATDestino");
            builder.Property(c => c.precoServicoPAFrequencia).IsRequired().HasColumnName("COD_PrecoServicoPAFrequencia");
            builder.Property(c => c.tipoPontoAtendimento).IsRequired().HasColumnName("COD_TipoPontoAtendimento");
            builder.Property(c => c.QT_MediaEmbarque).HasColumnName("QT_MediaEmbarque");
            builder.Property(c => c.DES_Faturamento).HasColumnName("DES_Faturamento");
            builder.Property(c => c.DES_Observacao).HasColumnName("DES_Observacao");
            builder.Property(c => c.DES_FaturamentoPrincipal).HasColumnName("DES_FaturamentoPrincipal");
            builder.Property(c => c.DES_FaturamentoDetalhe).HasColumnName("DES_FaturamentoDetalhe");
            builder.Property(c => c.DT_Inclusao).IsRequired().HasColumnName("DT_Inclusao");
            builder.Property(c => c.DT_Alteracao).HasColumnName("DT_Alteracao");
            builder.Property(c => c.Flg_Situacao).IsRequired().HasColumnName("FLG_Situacao");
            builder.Property(c => c.tipoTransporte).HasColumnName("COD_TipoTransporte");
            builder.Property(c => c.FLG_PontoEntregaDireta).HasColumnName("FLG_PontoEntregaDireta");
        }
    }
}
