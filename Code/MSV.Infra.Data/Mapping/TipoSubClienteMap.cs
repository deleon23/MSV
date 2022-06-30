using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class TipoSubClienteMap : IEntityTypeConfiguration<TipoSubCliente>
    {
        public void Configure(EntityTypeBuilder<TipoSubCliente> builder)
        {
            builder.ToTable("COR_TipoSubCliente");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("Cod_TpSubCliente");

            builder.Property(c => c.Des_TpSubCliente)
                .IsRequired()
                .HasColumnName("Des_TpSubCliente");

            builder.Ignore(c => c.Flg_Situacao);
        }
    }
}
