using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class MaquinaMap : IEntityTypeConfiguration<Maquina>
    {
        public void Configure(EntityTypeBuilder<Maquina> builder)
        {
            builder.ToTable("MSV_MAQUINA");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_MAQUINA");

            builder.Property(c => c.Nr_Serie)
                .IsRequired()
                .HasColumnName("NR_SERIE");

            builder.Property(c => c.Des_Maquina)
                .IsRequired()
                .HasColumnName("DES_MAQUINA");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("FLG_SITUACAO");
        }
    }
}
