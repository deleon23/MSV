using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class FrequenciaMap : IEntityTypeConfiguration<Frequencia>
    {
        public void Configure(EntityTypeBuilder<Frequencia> builder)
        {
            builder.ToTable("MSV_Frequencia");

            builder.Property(c => c.Id)
                .HasColumnName("ID_Frequencia");

            builder.Property(c => c.DES_Quinzena)
                .HasColumnName("DES_Quinzena");

            builder.Property(c => c.DES_DiasSemana)
               .HasColumnName("DES_DiasSemana");

            builder.Property(c => c.DES_SemanaMes)
               .HasColumnName("DES_SemanaMes");

            //builder.Property(c => c.DES_DiasMes)
            //   .HasColumnName("DES_DiasMes");

            builder.Property(c => c.DES_DiasUteis)
               .HasColumnName("DES_DiasUteis");

            builder.Property(c => c.DES_Cronograma)
                .HasColumnName("DES_Cronograma");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("Flg_Situacao");
        }
    }
}
