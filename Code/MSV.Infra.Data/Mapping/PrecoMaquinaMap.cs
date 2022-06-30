using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class PrecoMaquinaMap : IEntityTypeConfiguration<PrecoMaquina>
    {
        public void Configure(EntityTypeBuilder<PrecoMaquina> builder)
        {
            builder.ToTable("MSV_PRECOPAMAQUINA");

            builder.Property(c => c.Id)
                .IsRequired()
                .HasColumnName("ID_PRECOPAMAQUINA");

            builder.Property(c => c.COD_PRECOPONTOATENDIMENTO)
                .IsRequired()
                .HasColumnName("COD_PRECOPONTOATENDIMENTO");

            builder.Property(c => c.COD_MAQUINA)
                .IsRequired()
                .HasColumnName("COD_MAQUINA");

            builder.Property(c => c.DT_INCLUSAO)
                .IsRequired()
                .HasColumnName("DT_INCLUSAO");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("FLG_SITUACAO");
        }
    }
}
