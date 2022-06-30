namespace MSV.Domain.Entities
{
    public class Maquina : BaseEntity
    {
        public Maquina()
        {
            precoMaquina = new PrecoMaquina();
        }

        public string Nr_Serie { get; set; }

        public string Des_Maquina { get; set; }

        //public bool Flg_Situacao { get; set; }

        public PrecoMaquina precoMaquina { get; set; }
    }
}
