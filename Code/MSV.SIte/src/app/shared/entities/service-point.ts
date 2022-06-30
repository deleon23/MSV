export class ServicePoint {
    constructor() { }

    // cabecalho_cliente
    public cli_RazaoSocial: string;
    public cli_Cnpj: string;
    public nom_Abvd_Filial: string;
    public banco: string;
    public cod_Agencia: string;
    public cod_Conta: string;
    public modalidade: string;
    public dT_VigenciaContrato: string;
    public responsavel: string;
    public cod_Contrato: number;

    // cabecalho_subcliente
    public subCli_RazaoSocial: string;
    public pontoOperacional: string;
    public subCli_Cnpj: string;
    public cod_Reduzido: string;
    public id_ContratoPontoAtendimento: number;
    public des_FamiliaServico: string;

    public cod_Banco :string;
    public nom_Banco :string;
    public noM_MEMORANDO: string
  }
