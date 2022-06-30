namespace MSV.Domain.Entities
{
    public class Filial : BaseEntity
    {
        public int Cod_Regional { get; set; }
        public string Nom_Filial { get; set; }
        public int Cod_Empresa { get; set; }
        public string Nom_Abvd_Filial { get; set; }
        public string Nom_Abvd_Nom_Filial
        {
            get
            {
                return "[" + Id + "|" + Cod_Regional + "] - " + Nom_Abvd_Filial.Trim() + " - " + Nom_Filial.Trim();
            }
        }
    }
}
