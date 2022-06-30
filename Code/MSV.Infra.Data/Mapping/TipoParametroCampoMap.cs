using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class TipoParametroCampoMap
    {
        public void Configure(EntityTypeBuilder<TipoParametroCampo> builder)
        {
            builder.ToTable("MSV_TipoParametroCampo");

            builder.Property(c => c.ID_TipoParametroCampo)
                .IsRequired()
                .HasColumnName("ID_TipoParametroCampo");

            builder.Property(c => c.Des_TipoParametroCampo)
                 .HasColumnName("Des_TipoParametroCampo");

            builder.Property(c => c.DT_INCLUSAO)
                .IsRequired()
                .HasColumnName("DT_INCLUSAO");

            builder.Property(c => c.DT_ALTERACAO)
                .HasColumnName("DT_ALTERACAO");

            builder.Property(c => c.Flg_Situacao)
                .IsRequired()
                .HasColumnName("FLG_SITUACAO");

        }
    }
}
