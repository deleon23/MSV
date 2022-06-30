export class Frequencia {
  constructor(deS_Cronograma: string,
              deS_Quinzena: string,
              deS_DiasSemana: string,
              deS_SemanasMes: string,
              // deS_DiasMes: string,
              deS_DiasUteis: string) {
    this.deS_Quinzena = deS_Quinzena || '';
    this.deS_DiasSemana = deS_DiasSemana || '';
    this.deS_SemanasMes = deS_SemanasMes || '';
    // this.deS_DiasMes = deS_DiasMes || '';
    this.deS_DiasUteis = deS_DiasUteis || '';
    this.deS_Cronograma = deS_Cronograma || '';
  }

  id: number;
  deS_Quinzena: string;
  deS_DiasSemana: string;
  deS_SemanasMes: string;
  // deS_DiasMes: string;
  deS_DiasUteis: string;
  deS_Cronograma: string;

  get descricao(): string {
    const cronograma = this.obterDescricaoCronogramas(this.deS_Cronograma.replace(/ /g, ''));
    const quinzena = this.obterDescricaoQuinzenas(this.deS_Quinzena.replace(/ /g, ''));
    const diasSemana = this.obterDescricaoDiasSemana(this.deS_DiasSemana.replace(/ /g, ''));
    const semanasMes = this.obterDescricaoSemanasMes(this.deS_SemanasMes.replace(/ /g, ''));
    // const diasMes = this.obterDescricaoDiasMes(this.deS_DiasMes.replace(/ /g, ''));
    const diasUteis = this.obterDescricaoDiasUteis(this.deS_DiasUteis.replace(/ /g, ''));

    let descricao = '';

    if (cronograma) {
      descricao = `${cronograma}`;
    }

    if (quinzena) {
      descricao = descricao ? `${descricao}. ${quinzena}` : quinzena;
    }

    if (diasSemana) {
      descricao = descricao ? `${descricao}. ${diasSemana}` : diasSemana;
    }

    if (semanasMes) {
      descricao = descricao ? `${descricao}. ${semanasMes}` : semanasMes;
    }

    // if (diasMes) {
    //   descricao = descricao ? `${descricao}. ${diasMes}` : diasMes;
    // }

    if (diasUteis) {
      descricao = descricao ? `${descricao}. ${diasUteis}` : diasUteis;
    }

    return descricao;
  }

  private obterDescricaoCronogramas(cronograma: string): string {
    if (!cronograma) {
      return '';
    }

    if (cronograma === '1') {
      return 'Cronograma Mensal';
    }

    if (cronograma === '2') {
      return 'Cronograma Anual';
    }

    return '';
  }

  private obterDescricaoQuinzenas(quinzena: string): string {
    if (!quinzena) {
      return '';
    }

    if (quinzena === '1') {
      return '1ª Quinzena';
    }

    if (quinzena === '2') {
      return '2ª Quinzena';
    }

    if (quinzena === '1,2') {
      return '1ª e 2ª Quinzenas';
    }

    return '';
  }

  private obterDescricaoDiasSemana(diasSemana: string): string {
    if (!diasSemana) {
      return '';
    }

    let retorno = '';

    if (diasSemana.indexOf('1') > -1) {
      retorno = 'Segundas-feiras';
    }

    if (diasSemana.indexOf('2') > -1) {
      retorno = retorno ? `${retorno}, Terças-feiras` : 'Terças-feiras';
    }

    if (diasSemana.indexOf('3') > -1) {
      retorno = retorno ? `${retorno}, Quartas-feiras` : 'Quartas-feiras';
    }

    if (diasSemana.indexOf('4') > -1) {
      retorno = retorno ? `${retorno}, Quintas-feiras` : 'Quintas-feiras';
    }

    if (diasSemana.indexOf('5') > -1) {
      retorno = retorno ? `${retorno}, Sextas-feiras` : 'Sextas-feiras';
    }

    if (diasSemana.indexOf('6') > -1) {
      retorno = retorno ? `${retorno}, Sábados` : 'Sábados';
    }

    if (diasSemana.indexOf('7') > -1) {
      retorno = retorno ? `${retorno}, Domingos` : 'Domingos';
    }

    return retorno;
  }

  private obterDescricaoSemanasMes(semanasMes: string): string {
    if (!semanasMes) {
      return '';
    }

    let retorno = '';

    if (semanasMes.indexOf('1') > -1) {
      retorno = 'Primeira';
    }

    if (semanasMes.indexOf('2') > -1) {
      retorno = retorno ? `${retorno}, Segunda` : 'Segunda';
    }

    if (semanasMes.indexOf('3') > -1) {
      retorno = retorno ? `${retorno}, Terceira` : 'Terceira';
    }

    if (semanasMes.indexOf('4') > -1) {
      retorno = retorno ? `${retorno}, Quarta` : 'Quarta';
    }

    const quantidade = semanasMes.split(',').length;

    return `${retorno} ${quantidade > 1 ? 'Semanas' : 'Semana'} do Mês`;
  }

  private obterDescricaoDiasMes(diasMes: string): string {
    if (!diasMes) {
      return '';
    }

    const quantidade = diasMes.split(',').length;

    return `${quantidade > 1 ? 'Dias' : 'Dia'} ${diasMes.replace(/,/g, ', ')} do mês`;
  }

  private obterDescricaoDiasUteis(diasUteis: string): string {
    if (!diasUteis) {
      return '';
    }

    const quantidade = diasUteis.split(',').length;

    return `${diasUteis.replace(/,/g, 'º, ').replace(/23/g, 'Último')} ${quantidade > 1 ? 'dias úteis' : 'dia útil'}`;
  }
}
