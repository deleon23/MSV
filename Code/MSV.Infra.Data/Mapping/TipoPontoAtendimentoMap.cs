using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class TipoPontoAtendimentoMap : IEntityTypeConfiguration<TipoPontoAtendimento>
    {
        public void Configure(EntityTypeBuilder<TipoPontoAtendimento> builder)
        {
            builder.ToTable("MSV_TIPOPONTOATENDIMENTO");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_TIPOPONTOATENDIMENTO");

            builder.Property(c => c.DES_TIPOPONTOATENDIMENTO)
                .IsRequired()
                .HasColumnName("DES_TIPOPONTOATENDIMENTO");

            builder.Property(c => c.DT_INCLUSAO)
                .HasColumnName("DT_INCLUSAO");

            builder.Property(c => c.DT_ALTERACAO)
                .HasColumnName("DT_ALTERACAO");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
