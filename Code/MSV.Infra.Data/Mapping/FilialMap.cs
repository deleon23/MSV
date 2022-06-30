using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class FilialMap
    {
        public void Configure(EntityTypeBuilder<Filial> builder)
        {
            builder.ToTable("COR_Filial");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("Cod_Filial");

            builder.Property(c => c.Cod_Regional)
                .IsRequired()
                .HasColumnName("Cod_Regional");

            builder.Property(c => c.Cod_Empresa)
                .IsRequired()
                .HasColumnName("Cod_Empresa");

            builder.Property(c => c.Nom_Abvd_Filial)
                .IsRequired()
                .HasColumnName("Nom_Abvd_Filial");

            builder.Property(c => c.Nom_Filial)
                .IsRequired()
                .HasColumnName("Nom_Filial");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_SituacaoRegistro")
                .HasColumnType("tinyint(1)");
        }
    }
}
