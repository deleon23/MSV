using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class PrecoPaFrequenciaMap : IEntityTypeConfiguration<PrecoPaFrequencia>
    {
        public void Configure(EntityTypeBuilder<PrecoPaFrequencia> builder)
        {
            builder.ToTable("MSV_PRECOPAFREQUENCIA");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_PRECOPAFREQUENCIA");

            builder.Property(c => c.COD_PROPOSTATIPOPROPOSTASERVICO)
                .IsRequired()
                .HasColumnName("COD_PROPOSTATIPOPROPOSTASERVICO");

            builder.Property(c => c.COD_FREQUENCIA)
                .IsRequired()
                .HasColumnName("COD_FREQUENCIA");

            builder.Property(c => c.COD_FERIADO)
                .HasColumnName("COD_FERIADO");

            builder.Property(c => c.COD_PERIODORECOLHIMENTO)
                .HasColumnName("COD_PERIODORECOLHIMENTO");

            builder.Property(c => c.COD_PERIODOSUPRIMENTO)
                .HasColumnName("COD_PERIODOSUPRIMENTO");

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
