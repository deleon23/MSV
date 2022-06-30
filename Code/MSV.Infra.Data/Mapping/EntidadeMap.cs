using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class EntidadeMap : IEntityTypeConfiguration<Entidade>
    {
        public void Configure(EntityTypeBuilder<Entidade> builder)
        {
            builder.ToTable("CLI_Entidade");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("Id_Entidade");

            builder.Property(c => c.Cod_Cnpj)
                .HasColumnName("Cod_Cnpj");

            builder.Property(c => c.Nom_RazaoSocial)
               .HasColumnName("Nom_RazaoSocial");

            builder.Property(c => c.Nom_Fantasia)
               .HasColumnName("Nom_Fantasia");

            builder.Property(c => c.Cod_InscricaoEstadual)
               .HasColumnName("Cod_InscricaoEstadual");

            builder.Property(c => c.Cod_InscricaoMunicipal)
               .HasColumnName("Cod_InscricaoMunicipal");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
