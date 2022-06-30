namespace MSV.Domain.Entities
{
    public class Feriado : BaseEntity
    {
        public Feriado()
        {
            TipoFeriado = new TipoFeriado();
            Periodo = new Periodo();
        }
        public int? COD_TipoFeriado { get; set; }
        public TipoFeriado TipoFeriado { get; set; }
        public int? COD_Periodo { get; set; }
        public Periodo Periodo { get; set; }
    }
}
