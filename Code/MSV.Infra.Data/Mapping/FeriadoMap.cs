using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class FeriadoMap : IEntityTypeConfiguration<Feriado>
    {
        public void Configure(EntityTypeBuilder<Feriado> builder)
        {
            builder.ToTable("MSV_Feriado");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_Feriado");

            builder.Property(c => c.COD_TipoFeriado)
                .IsRequired()
                .HasColumnName("COD_TipoFeriado");

            builder.Property(c => c.COD_Periodo)
                .HasColumnName("COD_Periodo");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
