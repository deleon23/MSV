// import { CapaViewModel } from "app/pages/comum/capa/models/viewModels/CapaViewModel";
// import { CondicaoGeralViewModel } from "app/pages/comum/condicoes-gerais/models/viewModels/CondicaoGeralViewModel";


export class TipoPropostaViewModel {
    public ID_TipoProposta: number;
    public COD_Capa?: number;
    public COD_CondicaoGeral?: number;
    public NOM_TipoProposta: string;
    public DES_TipoProposta: string;
    public NR_DiasVigencia: number;
    public DES_CodigoInterno: string;
    public Cod_Tipo_Valor: number;
    public ST_TipoProposta: boolean;
    public FLG_Situacao: boolean;
    public COD_TpProcessoWKF?: number;
    public NOM_FamiliaProduto: string;
    public NOM_Produto: string;
    public NOM_Servico: string;
    // public Capa?: CapaViewModel;
    // public CondicaoGeral?: CondicaoGeralViewModel;
    public FLG_EmAndamento: boolean;
    public TEM_PROPOSTA?: boolean = false;
    public DT_Inclusao?: Date;
    public Des_VlCondicaoGeral: string;
    public DT_Alteracao?: Date;
    public Nom_Capa: string;
    public COD_CategoriaTipoProposta: boolean = false;
}


export const CategoriaTipoProposta = {
  Compusafe: 1
};
