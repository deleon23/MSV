import { PrecoFrequencia } from './preco-frequencia';

export class PrecoServicoContrato {
    constructor() { }

    cliente: string;
    subCliente: string;
    matriz: string; //mudou para cnab
    cliente_Fat: string;
    cliente_Fat_SubCliente: string;
    noM_Produto: string;
    deS_CodigoInterno: string;
    flG_SITUACAO: boolean;
    dT_VIGENCIAINICIO: Date;
    dT_VIGENCIAFIM: Date;
    dT_BASE: Date;
    nom_Abvd_Filial: string;
    vL_PRECO: number;
    tX_ADVALOREM: number;
    tX_PERNOITE: number;
    vL_FRANQUIA: number;
    tX_ADPERM: number;
    vL_INTERVMINUTOS: number;
    perC_ADICNOTURNO: number;
    coD_CONTRATOREDUZIDO: number;
    id: number;
    coD_FamiliaProduto: number;
    coD_Produto: number;
    coD_Servico: number;
    coD_FLUXO: number;
    des_Composicao: string;

    precoFrequencias: PrecoFrequencia[];
}
