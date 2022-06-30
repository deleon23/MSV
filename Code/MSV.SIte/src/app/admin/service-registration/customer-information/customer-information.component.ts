import { Component, OnInit, Input } from '@angular/core';
import { PrecoServicoContrato } from 'src/app/shared/entities/preco-servico-contrato';

@Component({
  selector: 'app-customer-information',
  templateUrl: './customer-information.component.html',
  styleUrls: ['./customer-information.component.scss']
})
export class CustomerInformationComponent implements OnInit {

  @Input() precoServicoContrato: PrecoServicoContrato;

  constructor() {
    this.precoServicoContrato = new PrecoServicoContrato();
  }

  ngOnInit() {
  }

}
