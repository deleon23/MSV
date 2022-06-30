using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class PrecoPontoAtendimentoMap : IEntityTypeConfiguration<PrecoPontoAtendimento>
    {
        public void Configure(EntityTypeBuilder<PrecoPontoAtendimento> builder)
        {
            builder.ToTable("MSV_PRECOPONTOATENDIMENTO");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_PRECOPONTOATENDIMENTO");

            builder.Property(c => c.COD_PRECO)
                .IsRequired()
                .HasColumnName("COD_PRECO");

            builder.Property(c => c.COD_PRECOPAFREQUENCIA)
                .IsRequired()
                .HasColumnName("COD_PRECOPAFREQUENCIA");

            builder.Property(c => c.COD_TIPOPONTOATENDIMENTO)
                .IsRequired()
                .HasColumnName("COD_TIPOPONTOATENDIMENTO");

            builder.Property(c => c.DT_INCLUSAO)
                .IsRequired()
                .HasColumnName("DT_INCLUSAO");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("FLG_SITUACAO");
        }
    }
}
