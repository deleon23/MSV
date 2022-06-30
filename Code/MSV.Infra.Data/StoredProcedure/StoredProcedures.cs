namespace MSV.Infra.Data.StoredProcedure
{
    public static class StoredProcedures
    {
        public static readonly string SelectAdministrativeUser = "SP_SAM_Sel_LoginsAdministrativos";
        public static readonly string SelectDadosCadPreco = "SP_MSV_SEL_DadosCadPreco";
        public static readonly string SelectPreco = "sp_sic_SEL_preco_select";
        public static readonly string SelectCarregarDadosPreco = "SP_SIC_SEL_CarregarDadosCadPreco";
        public static readonly string SelectContratosSubClientes = "SP_MSV_SEL_ContratosSubClientes";
        public static readonly string SelectServicosContrato = "SP_MSV_SEL_ServicosContrato";
        public static readonly string SelectPrecoServicoContrato = "SP_MSV_SEL_PrecoServicoContrato";
        public static readonly string SelectSubClientesPorCliente = "SP_MSV_SEL_SubClientesPorCliente";
        public static readonly string SelectClientes = "SP_MSV_SEL_Clientes";
        public static readonly string SelectPontoAtendimentoOrigem = "SP_MSV_SEL_PontoAtendimento";
        public static readonly string SelectParametroCampo = "SP_MSV_SEL_ParametroCampo";
        public static readonly string SelectPrecoServicoPontoAtendimento = "SP_MSV_SEL_PrecoServicoPontoAtendimento";
        public static readonly string SelectControleAcesso = "SP_MSV_CONTROLE_ACESSO";
    }
}
