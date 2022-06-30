import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { ServicePointOriginService } from 'src/app/shared/services/service-point-origin.service';
import { ServicePointOrigin } from 'src/app/shared/entities/service-point-origin';

@Component({
  selector: 'app-service-point',
  templateUrl: './service-point.component.html',
  styleUrls: ['./service-point.component.scss']
})
export class ServicePointComponent implements OnInit {
  stringFilter: string;

  public message = '';
  public errorMessage = false;

  public pontosAtendimento: ServicePointOrigin[] = [
    // { id: 1, nome: '12 - 5725024 - ABENCOADA UEHARA SP VL ROMANOP' },
    // { id: 2, nome: '14 - 5725023 - ABENCOADA UEHARA SP VL ROMANOP' },
    // { id: 3, nome: '3 - 5725022 - ABENCOADA UEHARA SP VL ROMANOP' }
  ];

  public servicePointOriginSelected: ServicePointOrigin[];

  // Emiter para atualizar o Grid da Tela Pai
  public onServicePointOriginSelected: EventEmitter<ServicePointOrigin> = new EventEmitter();

  constructor(
    public bsModalRef: BsModalRef)
    {
      this.pontosAtendimento = [];
    }

  ngOnInit() {
    this.pontosAtendimento = [];
    this.servicePointOriginSelected = [];
  }

  pontosAtendimentoFilter(filter: string) {
    if (!filter) {
      return this.pontosAtendimento;
    }

    return this.pontosAtendimento.filter(
      (pontoAtendimento) => pontoAtendimento.nom_PontoAtendimento
        .toLowerCase()
        .indexOf(filter.toLocaleLowerCase()) > -1
    );
  }


public selecionarPonto(){

  if(this.servicePointOriginSelected.length >0 ){
  // Enviando de volta o ponto selecionado e lá fazer o filtro de exibicao dos servicos
  this.onServicePointOriginSelected.emit(this.servicePointOriginSelected[0]);
  }

}



public changeServicePointOriginSelected(checkBox :any, servicePoint: ServicePointOrigin):void {

  this.servicePointOriginSelected = []

  if (checkBox.target.checked) {
    this.servicePointOriginSelected.push(servicePoint);
  }

  if (!checkBox.target.checked) {
    const index = this.servicePointOriginSelected.indexOf(servicePoint);
    this.servicePointOriginSelected.splice(index, 1);
  }

}

}
