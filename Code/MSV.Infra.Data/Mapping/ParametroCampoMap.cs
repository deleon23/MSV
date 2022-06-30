using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MSV.Domain.Entities;

namespace MSV.Infra.Data.Mapping
{
    public class ParametroCampoMap
    {
        public void Configure(EntityTypeBuilder<ParametroCampo> builder)
        {
            builder.ToTable("MSV_ParametroCampo");

            builder.Property(c => c.ID_ParametroCampo)
                .IsRequired()
                .HasColumnName("ID_ParametroCampo");

            builder.Property(c => c.COD_FamiliaProduto)
                 .HasColumnName("COD_FamiliaProduto");

            builder.Property(c => c.COD_Produto)
                .HasColumnName("COD_Produto");

            builder.Property(c => c.COD_Servico)
                .HasColumnName("COD_Servico");

            builder.Property(c => c.Nom_Campo)
                .HasColumnName("Nom_Campo");

            builder.Property(c => c.Tp_Campo)
                .HasColumnName("Tp_Campo");

            builder.Property(c => c.Des_IdentificadorHTML)
                .HasColumnName("Des_IdentificadorHTML");

            // tipoParametroCampo tem Map dele

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
