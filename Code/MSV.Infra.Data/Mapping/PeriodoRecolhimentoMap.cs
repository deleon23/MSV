using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class PeriodoRecolhimentoMap : IEntityTypeConfiguration<PeriodoRecolhimento>
    {
        public void Configure(EntityTypeBuilder<PeriodoRecolhimento> builder)
        {
            builder.ToTable("MSV_PeriodoRecolhimento");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_PeriodoRecolhimento");

            builder.Property(c => c.COD_Periodo)
                .HasColumnName("COD_Periodo");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
