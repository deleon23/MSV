using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class TipoFeriadoMap : IEntityTypeConfiguration<TipoFeriado>
    {
        public void Configure(EntityTypeBuilder<TipoFeriado> builder)
        {
            builder.ToTable("MSV_TipoFeriado");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_TipoFeriado");

            builder.Property(c => c.Des_TipoFeriado)
                .HasColumnName("Des_TipoFeriado");

            builder.Property(c => c.Nom_TipoFeriado)
               .HasColumnName("Nom_TipoFeriado");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
