export class EnderecoOrigemDestinoImportacaoViewModel {
  public QuantidadeTotal?: number;
  public TotalImportado?: number;
  public Mensagens: Mensagem[]
}

export class Mensagem {
  public NomePonto?: string;
  public Descricao?: string;
  public Erro?: boolean;
  public Importado?: boolean;
}
