using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class FluxoOperacionalMap : IEntityTypeConfiguration<FluxoOperacional>
    {
        public void Configure(EntityTypeBuilder<FluxoOperacional> builder)
        {
            builder.ToTable("COR_FluxoOperacional");

            builder.Property(c => c.Id)
               .IsRequired()
               .HasColumnName("Cod_Fluxo")
               .HasColumnType("tinyint(1)");

            builder.Property(c => c.Descricao)
                .IsRequired()
                .HasColumnName("Descricao");

            builder.Property(c => c.Dt_Inclusao)
                .HasColumnName("Dt_Inclusao");

            builder.Property(c => c.Dt_Alteracao)
                .HasColumnName("Dt_Alteracao");

            builder.Ignore(c => c.Flg_Situacao);
        }
    }
}
