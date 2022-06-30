namespace MSV.Domain.Entities
{
    public class PeriodoRecolhimento : BaseEntity
    {
        public PeriodoRecolhimento()
        {
            Periodo = new Periodo();
        }

        public int? COD_Periodo { get; set; }
        public Periodo Periodo { get; set; }
    }
}
