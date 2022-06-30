import { Component, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap';

@Component({
  selector: 'app-reduced-code',
  templateUrl: './reduced-code.component.html',
  styleUrls: ['./reduced-code.component.scss']
})
export class ReducedCodeComponent implements OnInit {
  stringFilter: string;

  codigosReduzidos: any[] = [
    { id: 1, nome: '1547799 - ABENCOADA UEHARA SP VL MARIANA' },
    { id: 2, nome: '1547800 - ABENCOADA UEHARA SP MOEMA' },
    { id: 3, nome: '1547801 - ABENCOADA UEHARA SP JARDINS GUARANI' },
    { id: 1, nome: '1547802 - ABENCOADA UEHARA SP JARDIM SANTO ANTONIO' },
    { id: 2, nome: '1547803 - ABENCOADA UEHARA SP PIRITUBA' }
  ];

  constructor(public modalRef: BsModalRef) { }

  ngOnInit() {
  }

  codigosReduzidosFilter(filter: string) {
    if (!filter) {
      return this.codigosReduzidos;
    }

    return this.codigosReduzidos.filter(
      (codigoReduzido) => codigoReduzido.nome
        .toLowerCase()
        .indexOf(filter.toLocaleLowerCase()) > -1
    );
  }

}
