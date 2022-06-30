using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class PrecoMap : IEntityTypeConfiguration<Preco>
    {
        public void Configure(EntityTypeBuilder<Preco> builder)
        {
            builder.ToTable("MSV_PRECO");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_PRECO");

            builder.Property(c => c.COD_PRECOSEQ)
                .HasColumnName("COD_PRECOSEQ");

            builder.Property(c => c.COD_PRECOORIGEM)
                .HasColumnName("COD_PRECOORIGEM");

            builder.Property(c => c.COD_CONTRATOREDUZIDO)
                .IsRequired()
                .HasColumnName("COD_CONTRATOREDUZIDO");

            builder.Property(c => c.COD_SERVICO)
                .IsRequired()
                .HasColumnName("COD_SERVICO");

            builder.Property(c => c.COD_TRIBUTACAO)
                .IsRequired()
                .HasColumnName("COD_TRIBUTACAO");

            builder.Property(c => c.COD_SAV_ENTIDADE)
                .IsRequired()
                .HasColumnName("COD_SAV_ENTIDADE");

            builder.Property(c => c.COD_SAV_ENTIDADEENDERECO)
                .IsRequired()
                .HasColumnName("COD_SAV_ENTIDADEENDERECO");

            builder.Property(c => c.COD_SAV_CNAB_ENTIDADEENDERECO)
                .IsRequired()
                .HasColumnName("COD_SAV_CNAB_ENTIDADEENDERECO");

            builder.Property(c => c.COD_FAT_ENTIDADE)
                .IsRequired()
                .HasColumnName("COD_FAT_ENTIDADE");

            builder.Property(c => c.COD_FAT_ENTIDADEENDERECO)
                .IsRequired()
                .HasColumnName("COD_FAT_ENTIDADEENDERECO");

            builder.Property(c => c.COD_FRANQUIAGRUPO)
                .IsRequired()
                .HasColumnName("COD_FRANQUIAGRUPO");

            builder.Property(c => c.COD_CARGAHORARIA)
                .IsRequired()
                .HasColumnName("COD_CARGAHORARIA");

            builder.Property(c => c.COD_PRECOSTATUS)
                .IsRequired()
                .HasColumnName("COD_PRECOSTATUS");

            builder.Property(c => c.DT_VIGENCIAINICIO)
                .IsRequired()
                .HasColumnName("DT_VIGENCIAINICIO");

            builder.Property(c => c.DT_VIGENCIAFIM)
                .HasColumnName("DT_VIGENCIAFIM");

            builder.Property(c => c.FLG_CUSTODIAENTRADA)
                .IsRequired()
                .HasColumnName("FLG_CUSTODIAENTRADA");

            builder.Property(c => c.FLG_CUSTODIATRANSICAO)
                .IsRequired()
                .HasColumnName("FLG_CUSTODIATRANSICAO");

            builder.Property(c => c.FLG_CUSTODIASALDO)
                .HasColumnName("FLG_CUSTODIASALDO");

            builder.Property(c => c.NOM_MEMORANDO)
                .HasColumnName("NOM_MEMORANDO");

            builder.Property(c => c.DES_ENTIDADECONTRATO)
                .HasColumnName("DES_ENTIDADECONTRATO");

            builder.Property(c => c.FLG_EXECUTADONARECEPCAO)
                .IsRequired()
                .HasColumnName("FLG_EXECUTADONARECEPCAO");

            builder.Property(c => c.FLG_ELETRONICO)
                .IsRequired()
                .HasColumnName("FLG_ELETRONICO");

            builder.Property(c => c.COD_REGIONAL_SAVAL)
                .HasColumnName("COD_REGIONAL_SAVAL");

            builder.Property(c => c.COD_FILIAL_SAVAL)
                .HasColumnName("COD_FILIAL_SAVAL");

            builder.Property(c => c.COD_REDUZIDO_SAVAL)
                .HasColumnName("COD_REDUZIDO_SAVAL");

            builder.Property(c => c.COD_REGIONAL_TICKET)
                .HasColumnName("COD_REGIONAL_TICKET");

            builder.Property(c => c.COD_FILIAL_TICKET)
                .HasColumnName("COD_FILIAL_TICKET");

            builder.Property(c => c.COD_REDUZIDO_TICKET)
                .HasColumnName("COD_REDUZIDO_TICKET");

            builder.Property(c => c.COD_REGIONAL_CHEQUES)
                .HasColumnName("COD_REGIONAL_CHEQUES");

            builder.Property(c => c.COD_FILIAL_CHEQUES)
                .HasColumnName("COD_FILIAL_CHEQUES");

            builder.Property(c => c.COD_REDUZIDO_CHEQUES)
                .HasColumnName("COD_REDUZIDO_CHEQUES");

            builder.Property(c => c.VL_PRECO)
                .HasColumnName("VL_PRECO");

            builder.Property(c => c.TX_ADVALOREM)
                .HasColumnName("TX_ADVALOREM");

            builder.Property(c => c.TX_PERNOITE)
                .HasColumnName("TX_PERNOITE");

            builder.Property(c => c.DT_BASE)
                .HasColumnName("DT_BASE");

            builder.Property(c => c.QT_MAOOBRA)
                .HasColumnName("QT_MAOOBRA");

            builder.Property(c => c.VL_FRANQUIA)
                .HasColumnName("VL_FRANQUIA");

            builder.Property(c => c.TX_ADPERM)
                .HasColumnName("TX_ADPERM");

            builder.Property(c => c.VL_INTERVMINUTOS)
                .HasColumnName("VL_INTERVMINUTOS");

            builder.Property(c => c.DT_HORAADICNOTURNO)
                .HasColumnName("DT_HORAADICNOTURNO");

            builder.Property(c => c.PERC_ADICNOTURNO)
                .HasColumnName("PERC_ADICNOTURNO");

            builder.Property(c => c.COD_REGIONALRATEIO)
                .HasColumnName("COD_REGIONALRATEIO");

            builder.Property(c => c.COD_FILIALRATEIO)
                .HasColumnName("COD_FILIALRATEIO");

            builder.Property(c => c.VL_RATEIO)
                .HasColumnName("VL_RATEIO");

            builder.Property(c => c.COD_TIPO_VAL)
                .IsRequired()
                .HasColumnName("COD_TIPO_VAL");

            builder.Property(c => c.KM_DISTANCIA)
                .HasColumnName("KM_DISTANCIA");

            builder.Property(c => c.KM_PRECO)
                .HasColumnName("KM_PRECO");

            builder.Property(c => c.VLR_MINIMOSERVICOAEREO)
                .HasColumnName("VLR_MINIMOSERVICOAEREO");

            builder.Property(c => c.FLG_IMPORTACAOHISTORICO)
                .HasColumnName("FLG_IMPORTACAOHISTORICO");

            builder.Property(c => c.DT_INCLUSAO)
                .IsRequired()
                .HasColumnName("DT_INCLUSAO");

            builder.Property(c => c.DT_ALTERACAO)
                .HasColumnName("DT_ALTERACAO");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("FLG_SITUACAO");
        }
    }
}
