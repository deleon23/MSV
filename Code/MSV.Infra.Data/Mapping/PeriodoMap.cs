using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class PeriodoMap : IEntityTypeConfiguration<Periodo>
    {
        public void Configure(EntityTypeBuilder<Periodo> builder)
        {
            builder.ToTable("MSV_Periodo");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_Periodo");

            builder.Property(c => c.TMP_Inicio)
                .HasColumnName("TMP_Inicio");

            builder.Property(c => c.TMP_Fim)
                .HasColumnName("TMP_Fim");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
