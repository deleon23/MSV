using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class FamiliaProdutoMap : IEntityTypeConfiguration<FamiliaProduto>
    {
        public void Configure(EntityTypeBuilder<FamiliaProduto> builder)
        {
            builder.ToTable("COR_FamiliaProduto");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_FamiliaProduto");

            builder.Property(c => c.Nom_FamiliaProduto)
                .IsRequired()
                .HasColumnName("NOM_FamiliaProduto");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("FLG_Situacao");
        }
    }
}
