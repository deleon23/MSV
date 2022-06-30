using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class PeriodoSuprimentoMap : IEntityTypeConfiguration<PeriodoSuprimento>
    {
        public void Configure(EntityTypeBuilder<PeriodoSuprimento> builder)
        {
            builder.ToTable("MSV_PeriodoSuprimento");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_PeriodoSuprimento");

            builder.Property(c => c.COD_Periodo)
                .HasColumnName("COD_Periodo");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
