export class PropostaInput {
  public ID_Proposta: number;
  public Cod_TipoProposta: number;
  public Cod_Entidade: number;
  public Cod_Prestador: number;
  public Cod_Usuario: number;
  public COD_RepresentanteComercial: number;
  public Cod_EntidadeBanco: number;
  public Tp_TipoStatus: number;
  public Cod_EntidadeEndereco: number;
  public DT_Inicio: Date;
  public DT_Vigencia: Date;
  public FLG_Situacao: boolean = true;
  public Doc_CnpjContratante: string;
  public Nom_RazaoSocial: string;
  public End_Contratante: string;
  public End_Complemen: string;
  public End_CepContratante: string;
  public Cid_Contratante: string;
  public End_EstadoContratante: string;
  public End_Numero: string;
  public Compl_Contratante: string;
  public End_Bairro: string;
  public ST_Proposta: boolean;
  public DES_TipoProposta?: string;
  public FLG_EmAndamento: boolean;
  public DT_Inclusao?: Date;
  public Cod_SituacaoProposta?: number;
  public DT_Alteracao?: Date;
  public DES_JustiCancelamento: string;
  public Nr_Crm?: number;
  public DES_SituacaoProposta?: string;
  public Nom_Func: string;
  public DT_ConsultaBWS?: Date;
  public Nr_Proposta: number;
  public Nr_AnoProposta: number;
  public DT_Cancelamento?: Date;
  public DT_Aprovacao?: Date;
  public COD_ProcessoItem?: number;
  public FLG_CNPJPadrao: boolean;
}
