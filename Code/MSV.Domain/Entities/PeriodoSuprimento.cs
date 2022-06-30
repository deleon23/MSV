namespace MSV.Domain.Entities
{
    public class PeriodoSuprimento : BaseEntity
    {
        public PeriodoSuprimento()
        {
            Periodo = new Periodo();
        }
        public int? COD_Periodo { get; set; }
        public Periodo Periodo { get; set; }
    }
}
