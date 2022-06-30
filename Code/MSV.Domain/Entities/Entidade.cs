using MSV.Domain.MapHelperStoreProcedure.Attributes;

namespace MSV.Domain.Entities
{
    public class Entidade : BaseEntity
    {
        public string Cod_Cnpj { get; set; }
        public string Nom_RazaoSocial { get; set; }
        public string Nom_Fantasia { get; set; }
        public string Cod_InscricaoEstadual { get; set; }
        public string Cod_InscricaoMunicipal { get; set; }
        public string Cod_Cnpj_Nom_RazaoSocial
        {
            get
            {
                return Cod_Cnpj.Trim() + " - " + Nom_RazaoSocial.Trim();
            }
        }
        //public bool Flg_Situacao { get; set; }
    }
}
