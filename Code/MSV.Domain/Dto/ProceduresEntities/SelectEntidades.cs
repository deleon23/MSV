using MSV.Domain.MapHelperStoreProcedure.Attributes;

namespace MSV.Domain.Dto.ProceduresEntities
{
    public class SelectEntidades
    {
        [DataNames("Id", "Id")]
        public int Id { get; set; }
        [DataNames("Cod_Cnpj", "Cod_Cnpj")]
        public string Cod_Cnpj { get; set; }
        [DataNames("Nom_RazaoSocial", "Nom_RazaoSocial")]
        public string Nom_RazaoSocial { get; set; }
        [DataNames("Nom_Fantasia", "Nom_Fantasia")]
        public string Nom_Fantasia { get; set; }
        [DataNames("Cod_InscricaoEstadual", "Cod_InscricaoEstadual")]
        public string Cod_InscricaoEstadual { get; set; }
        [DataNames("Cod_InscricaoMunicipal", "Cod_InscricaoMunicipal")]
        public string Cod_InscricaoMunicipal { get; set; }
        [DataNames("Cod_Cnpj_Nom_RazaoSocial", "Cod_Cnpj_Nom_RazaoSocial")]
        public string Cod_Cnpj_Nom_RazaoSocial { get; set; }
        [DataNames("Flg_Situacao", "Flg_Situacao")]
        public bool Flg_Situacao { get; set; }
    }
}
