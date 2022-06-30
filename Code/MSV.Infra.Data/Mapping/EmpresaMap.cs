using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class EmpresaMap : IEntityTypeConfiguration<Empresa>
    {
        public void Configure(EntityTypeBuilder<Empresa> builder)
        {
            builder.ToTable("COR_EMPRESA");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("Cod_Empresa");

            builder.Property(c => c.Des_RazaoSocial)
                .IsRequired()
                .HasColumnName("RazaoSocial");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
