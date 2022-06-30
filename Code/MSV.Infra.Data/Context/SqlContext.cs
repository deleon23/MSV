using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using MSV.Domain.Entities;
using MSV.Infra.Data.Mapping;
using System.IO;

namespace MSV.Infra.Data.Context
{
    public class SqlContext : DbContext
    {
        public DbSet<Maquina> Maquina { get; set; }
        public DbSet<Empresa> Empresa { get; set; }
        public DbSet<Filial> Filial { get; set; }
        public DbSet<Entidade> Entidade { get; set; }
        public DbSet<FamiliaProduto> FamiliaProduto { get; set; }
        public DbSet<TipoSubCliente> TipoSubCliente { get; set; }
        public DbSet<PrecoMaquina> PrecoMaquina { get; set; }
        public DbSet<PrecoPontoAtendimento> PrecoPontoAtendimento { get; set; }
        public DbSet<Preco> Preco { get; set; }
        public DbSet<PrecoPaFrequencia> PrecoPaFrequencia { get; set; }
        public DbSet<Feriado> Feriado { get; set; }
        public DbSet<PeriodoRecolhimento> PeriodoRecolhimento { get; set; }
        public DbSet<PeriodoSuprimento> PeriodoSuprimento { get; set; }
        public DbSet<Frequencia> Frequencia { get; set; }
        public DbSet<TipoFeriado> TipoFeriado { get; set; }
        public DbSet<Periodo> Periodo { get; set; }
        public DbSet<FluxoOperacional> FluxoOperacional { get; set; }
        public DbSet<TipoPontoAtendimento> TipoPontoAtendimento { get; set; }

        IConfiguration _config;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
               .SetBasePath(Path.Combine(Directory.GetCurrentDirectory()))
               .AddJsonFile("appsettings.json")
               .Build();

                optionsBuilder.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        { 
            modelBuilder.Entity<Maquina>(new MaquinaMap().Configure);
            modelBuilder.Entity<Empresa>(new EmpresaMap().Configure);
            modelBuilder.Entity<Filial>(new FilialMap().Configure);
            modelBuilder.Entity<Entidade>(new EntidadeMap().Configure);
            modelBuilder.Entity<FamiliaProduto>(new FamiliaProdutoMap().Configure);
            modelBuilder.Entity<TipoSubCliente>(new TipoSubClienteMap().Configure);
            modelBuilder.Entity<PrecoMaquina>(new PrecoMaquinaMap().Configure);
            modelBuilder.Entity<PrecoPontoAtendimento>(new PrecoPontoAtendimentoMap().Configure);
            modelBuilder.Entity<Preco>(new PrecoMap().Configure);
            modelBuilder.Entity<PrecoPaFrequencia>(new PrecoPaFrequenciaMap().Configure);
            modelBuilder.Entity<Feriado>(new FeriadoMap().Configure);
            modelBuilder.Entity<PeriodoRecolhimento>(new PeriodoRecolhimentoMap().Configure);
            modelBuilder.Entity<PeriodoSuprimento>(new PeriodoSuprimentoMap().Configure);
            modelBuilder.Entity<Frequencia>(new FrequenciaMap().Configure);
            modelBuilder.Entity<TipoFeriado>(new TipoFeriadoMap().Configure);
            modelBuilder.Entity<Periodo>(new PeriodoMap().Configure);
            modelBuilder.Entity<FluxoOperacional>(new FluxoOperacionalMap().Configure);
            modelBuilder.Entity<TipoPontoAtendimento>(new TipoPontoAtendimentoMap().Configure);

            base.OnModelCreating(modelBuilder);
        }
    }
}
