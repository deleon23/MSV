import { Component, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap';

@Component({
  selector: 'app-manage-addresses',
  templateUrl: './manage-addresses.component.html',
  styleUrls: ['./manage-addresses.component.scss']
})
export class ManageAddressesComponent implements OnInit {

  origem: string;

  origens: any[] = [
    { id: 1, name: 'Magazine Luiza - Franca - CNPJ 9999999'},
    { id: 2, name: 'Banco Bradesco - Jundiaí - CNPJ 8888888'},
    { id: 3, name: 'Hipermercado Carrefour - Campinas - CNPJ 77777'}
  ];

  destino: string;

  destinos: any[] = [
    { id: 1, name: 'Magazine Luiza - Ribeirão Preto - CNPJ 9999999'},
    { id: 2, name: 'Banco Bradesco - Rio de Janeiro - CNPJ 8888888'},
    { id: 3, name: 'Magazine Luiza - Ibitinga - CNPJ 9999999'},
    { id: 3, name: 'Magazine Luiza - Rio Preto - CNPJ 9999999'},
    { id: 3, name: 'Magazine Luiza - Jundiaí - CNPJ 9999999'}
  ];

  constructor(public modalRef: BsModalRef) { }

  ngOnInit() {
  }

}
