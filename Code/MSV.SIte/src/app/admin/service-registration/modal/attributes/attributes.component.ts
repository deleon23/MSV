import { Component, OnInit } from '@angular/core';
import { BsModalRef  } from 'ngx-bootstrap';

@Component({
  selector: 'app-attributes',
  templateUrl: './attributes.component.html',
  styleUrls: ['./attributes.component.scss']
})
export class AttributesComponent implements OnInit {

  cliente: string;

  clientes: any[] = [
    { id: 1, name: 'Magazine Luiza'},
    { id: 2, name: 'Banco Bradesco'},
    { id: 3, name: 'Hipermercado Carrefour'}
  ];

  constructor(public modalRef: BsModalRef) { }

  ngOnInit() {
  }

}
