import { Component, OnInit, EventEmitter, Input } from '@angular/core';
import { BsLocaleService, defineLocale, ptBrLocale, BsModalRef } from 'ngx-bootstrap';

@Component({
  selector: 'app-contract',
  templateUrl: './contract.component.html',
  styleUrls: ['./contract.component.scss']
})
export class ContractComponent implements OnInit {
  contract: any;
  // @Input() private codPontoAtendimentoEmmit: EventEmitter<number>;
  // codPontoAtendimento: number;

  contracts: any[] = [
    {
      id: 1, codigo: '02.042', produto: 104, tipoServico: 'EVENTUAL', composicao: 'POR EMBARQUE', dataBase: '01/06/2017',
      filial: 'CPQ', dataFimLocal: '25/04/2016', dataContrato: '10/01/2016', vigenciaDe: '10/02/2016', vigenciaAte: '31/05/2016'
    },
    {
      id: 2, codigo: '02.044', produto: 105, tipoServico: 'ROTINEIRO', composicao: 'POR DESEMBARQUE', dataBase: '01/07/2018',
      filial: 'FOR', dataFimLocal: '26/05/2017', dataContrato: '11/03/2017', vigenciaDe: '10/03/2017', vigenciaAte: '31/03/2017'
    },
    {
      id: 3, codigo: '02.045', produto: 106, tipoServico: 'ESPECIAL', composicao: 'POR EMBARQUE', dataBase: '01/08/2019',
      filial: 'SAO', dataFimLocal: '27/06/2018', dataContrato: '12/04/2018', vigenciaDe: '10/04/2018', vigenciaAte: '31/04/2018'
    },
  ];

  constructor(
    private localeService: BsLocaleService,
    public modalRef: BsModalRef) { }

  ngOnInit() {
    defineLocale('pt-br', ptBrLocale);
    this.localeService.use('pt-br');

    this.contract = this.contracts.filter((contract) => contract.id === 1)[0];
    // if (this.codPontoAtendimentoEmmit) {
    //   this.codPontoAtendimentoEmmit.subscribe(data => {
    //     this.codPontoAtendimento = data;
    //     this.carregarContrato(this.codPontoAtendimento);
    //   });
    // }

    // this.carregarContrato(this.codPontoAtendimento);
  }

  // carregarContrato(codPontoAtendimento) {
  //   if (codPontoAtendimento) {
  //     this.contract = this.contracts.filter((contract) => contract.id === codPontoAtendimento)[0];
  //   }
  // }
}
