using MSV.Domain.MapHelperStoreProcedure.Attributes;

namespace MSV.Domain.Dto.ProceduresEntities
{
    public class SelectContratosSubClientesDto
    {
        [DataNames("Empresa", "Empresa")]
        public string Empresa { get; set; }
        [DataNames("Filial", "Filial")]
        public string Filial { get; set; }
        [DataNames("Cliente", "Cliente")]
        public string Cliente { get; set; }
        [DataNames("Cnpj", "CNPJ")]
        public string Cnpj { get; set; }
        [DataNames("TipoContrato", "TipoContrato")]
        public string TipoContrato { get; set; }
        [DataNames("Reduzido", "Reduzido")]
        public int? Reduzido { get; set; }
        [DataNames("Contrato", "Contrato")]
        public int Contrato { get; set; }
        [DataNames("SubCliente", "SubCliente")]
        public string SubCliente { get; set; }
        [DataNames("PontoOperacional", "PontoOperacional")]
        public string PontoOperacional { get; set; }
        [DataNames("Logradouro", "Logradouro")]
        public string Logradouro { get; set; }
        [DataNames("Numero", "Numero")]
        public string Numero { get; set; }
        [DataNames("TotalRows", "TotalRows")]
        public int TotalRows { get; set; }
        [DataNames("NumeroLinha", "NumeroLinha")]
        public int NumeroLinha { get; set; }
    }
}
