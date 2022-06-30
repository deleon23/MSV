import { Frequencia } from './frequencia';

export class PrecoFrequencia {
  constructor() { }

  public id: number;
  public coD_PROPOSTATIPOPROPOSTASERVICO: number;
  public coD_FREQUENCIA: number;
  public frequencia: Frequencia;
  public coD_FERIADO: number;
  public coD_PERIODORECOLHIMENTO: number;
  public coD_PERIODOSUPRIMENTO: number;
  public dT_INCLUSAO: Date;
  public dT_ALTERACAO: Date;
  public flg_Situacao: boolean;
}
