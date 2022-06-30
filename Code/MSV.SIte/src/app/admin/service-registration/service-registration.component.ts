import { Component, OnInit, EventEmitter, Input, Output } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { AttributesComponent } from './modal/attributes/attributes.component';
import { BankDetailsComponent } from './modal/bank-details/bank-details.component';
import { ContractComponent } from './modal/contract/contract.component';
import { ReducedCodeComponent } from './modal/reduced-code/reduced-code.component';
import { ServicePointComponent } from './modal/service-point/service-point.component';
import { ServicePointService } from 'src/app/shared/services/service-point.service';
import { ServicePoint } from 'src/app/shared/entities/service-point';
import { ActivatedRoute } from '@angular/router';
import { FamilyProductService } from 'src/app/shared/services/family-product.service';
import { FamiliaProduto } from 'src/app/shared/entities/family-product';
import { ServicoContratoService } from 'src/app/shared/services/servico-contrato.service';
import { ServicoContrato } from 'src/app/shared/entities/servico-contrato';
import { ServicePointOriginService } from 'src/app/shared/services/service-point-origin.service';
import { ServicePointOrigin } from 'src/app/shared/entities/service-point-origin';
import { PrecoServicoContratoService } from 'src/app/shared/services/preco-servico-contrato.service';
import { PrecoServicoContrato } from 'src/app/shared/entities/preco-servico-contrato';
import { ParametroCampo } from 'src/app/shared/entities/parametro-campo';
import { ParametroCampoService } from 'src/app/shared/services/parametro-campo.service';
import { PrecoFrequenciaService } from 'src/app/shared/services/preco-frequencia.service';
import { Frequencia } from 'src/app/shared/entities/frequencia';
import { PrecoFrequencia } from 'src/app/shared/entities/preco-frequencia';
import { OperationalFlowService } from 'src/app/shared/services/operational-flow.service';
import { FluxoOperacional } from 'src/app/shared/entities/operational-flow';
import { CompileMetadataResolver } from '@angular/compiler';

@Component({
  selector: 'app-service-registration',
  templateUrl: './service-registration.component.html',
  styleUrls: ['./service-registration.component.scss']
})
export class ServiceRegistrationComponent implements OnInit {

  message = '';
  errorMessage = false;
  pontoAtendimento: ServicePoint;
  familiasProduto: FamiliaProduto[];
  fluxosOperacionais: FluxoOperacional[];
  servicosContrato: ServicoContrato[];
  serviceClick = false;
  isOpen = true;
  stringFilter: string;
  contratosFiltered: ServicoContrato[];
  servicesFiltered: ServicoContrato[];
  modalRef: BsModalRef;
  pontosAtendimentoOrigin: ServicePointOrigin[] = [];
  precoServicoContrato: PrecoServicoContrato;
  parametrosCampos: ParametroCampo[] = [];

  constructor(
    private modalService: BsModalService,
    private servicePointService: ServicePointService,
    private route: ActivatedRoute,
    private familyProductService: FamilyProductService,
    private operationalFlowService: OperationalFlowService,
    private servicoContratoService: ServicoContratoService,
    private servicePointOriginService: ServicePointOriginService,
    private precoServicoContratoService: PrecoServicoContratoService,
    private parametroCampoService: ParametroCampoService,
    private precoFrequenciaService: PrecoFrequenciaService
  ) {
    this.pontoAtendimento = new ServicePoint();
    this.contratosFiltered = [];
    this.servicosContrato = [];
    this.servicesFiltered = [];
    this.precoServicoContrato = new PrecoServicoContrato();
  }

  ngOnInit() {
    this.contratosFiltered = [];
    this.servicosContrato = [];
    this.servicesFiltered = [];
    this.pontosAtendimentoOrigin = [];

    this.getFamiliaProduto();
    this.getFluxoOperacional();

    this.parametrosCampos = [];

    this.getDetalhes();
  }

  getFamiliaProduto() {
    this.familyProductService.list()
    .subscribe(
      (result) => {
        this.familiasProduto = result;
      },
      (error) => { console.log(error); }
    );
  }

  getFluxoOperacional() {
    this.operationalFlowService.list()
    .subscribe(
      (result) => {
        this.fluxosOperacionais = result;
      },
      (error) => { console.log(error); }
    );
  }

  public getDetalhes() {
    let contrato = this.route.snapshot.queryParamMap.get('contrato');
    let reduzido = this.route.snapshot.queryParamMap.get('reduzido');

    //parametro obrigatorio a ser recebidos ao invocar a pagina como componente via Bind
    if (!contrato) {
      console.log('Problema: parametros paramContrato NULO!');
      return;
    }

    const filtro = {
      cod_Reduzido: reduzido,
      cod_Contrato: contrato
    };

    const observable = this.servicePointService.filter(filtro);
    observable.subscribe(
      (result) => {

        if (result.length > 0) {
          this.pontoAtendimento = result[0];

          // carrega servicos do contrato
          this.getServicosContratos(this.pontoAtendimento.cod_Contrato, this.pontoAtendimento.id_ContratoPontoAtendimento)

          // carrega pontos de atendimento do contrato
          this.getServicePointsByContratos(this.pontoAtendimento.cod_Contrato, this.pontoAtendimento.id_ContratoPontoAtendimento)

        } else {
          this.message = 'Não foi encontrado resultados';
          this.errorMessage = true;
        }
      },
      (error) => { console.log(error); }
    );
  }

  public getServicosContratos(cod_contrato: number, id_ContratoPontoAtendimento: number) {

    //parametro obrigatorio a ser recebidos ao invocar a pagina como componente via Bind
    if (!cod_contrato) {
      console.log('Problema: parametros cod_contrato NULO!');
      return;
    }

    if (!id_ContratoPontoAtendimento)
      id_ContratoPontoAtendimento = 0

    const observable = this.servicoContratoService.getServicosByContrato(cod_contrato, id_ContratoPontoAtendimento);
    observable.subscribe(
      (result) => {

        if (result.length > 0) {
          this.servicosContrato = result;
          this.contratosFiltered = result;
        } else {
          this.message = 'Não foi encontrado resultados';
          this.errorMessage = true;
        }
      },
      (error) => { console.log(error); }
    );
  }

  contratosFilter(filter: string) {
    if (filter !== undefined) {
      return this.contratosFiltered;
    }

    return this.contratosFiltered.filter(
      (contrato) => contrato.deS_Servico
        .toLowerCase()
        .indexOf(filter.toLocaleLowerCase()) > -1
    );
  }

  carregaLayout(coD_FamiliaProduto: number, cod_Contrato: number, cod_servico: number, cod_reduzido: number) {
    //this.parametrosCamposTelaOcultar();
    this.getPrecoServicoContrato(cod_Contrato, cod_servico, cod_reduzido);
    this.serviceClick = true;

    this.getPrecoServicoContrato(cod_Contrato, cod_servico, cod_reduzido);

    if (coD_FamiliaProduto === 1) {
      this.isOpen = true;
      // this.showInformacoesClientes = true;
      // this.showServicos = true;
      // this.showValores = true;
    }

    if (coD_FamiliaProduto === 2) {
      this.isOpen = true;
      // this.showInformacoesClientes = true;
      // this.showServicos = true;
      // this.showValores = true;
    }

    if (coD_FamiliaProduto === 3) {
      this.isOpen = false;
      // this.showInformacoesClientes = false;
      // this.showServicos = false;
      // this.showValores = true;
    }
  }

  onChange(value) {
    if (value !== 'Todos') {
      this.contratosFiltered = this.servicosContrato.filter(
        (contrato) => contrato.coD_FamiliaProduto === +value
      );
    } else {
      this.contratosFiltered = this.servicosContrato;
    }
  }

  public cadastrarAtributo(): void {
    this.modalService.show(AttributesComponent, { class: 'gray modal-lg' });
  }

  public cadastrarDadosBancarios(): void {
    this.modalService.show(BankDetailsComponent, { class: 'gray modal-lg' });
  }

  public cadastrarMemorando(): void {
    this.modalService.show(ContractComponent, { class: 'gray modal-lg' });
  }

  public selecionarCodigoReduzido(): void {
    this.modalService.show(ReducedCodeComponent, { class: 'gray modal-lg' });
  }

  public selecionarPontoAtendimento(): void {

    this.modalRef = this.modalService.show(ServicePointComponent, { class: 'gray modal-lg' });

    this.modalRef.content.pontosAtendimento = this.pontosAtendimentoOrigin;
    this.modalRef.content.onServicePointOriginSelected.subscribe((resultado: ServicePointOrigin) => {
      this.pontoAtendimento.id_ContratoPontoAtendimento = resultado.id_ContratoPontoAtendimento;
      this.modalRef.hide();
      this.stringFilter = resultado.id_ContratoPontoAtendimento.toString();
      this.servicosContratoFilter(this.stringFilter);
    });
  }

  public getServicePointsByContratos(cod_contrato: number, id_ContratoPontoAtendimento: number) {
    if (cod_contrato == undefined) {
      console.log('Problema: parametros cod_contrato NULO!');
      return;
    }

    const observable = this.servicePointOriginService.getServicePointsOriginByContrato(cod_contrato, id_ContratoPontoAtendimento);
    observable.subscribe(
      (result) => {

        if (result.length > 0) {
          this.pontosAtendimentoOrigin = result;
        } else {
          this.message = 'Não foi encontrado resultados';
          this.errorMessage = true;
        }
      },
      (error) => { console.log(error); }
    );
  }

  public getPrecoServicoContrato(cod_contrato: number, cod_servico: number, cod_reduzido: number): void {
    if (cod_contrato === undefined || cod_servico === undefined) {
      console.log('Problema: parametros cod_contrato e cod_servico NULO!');
      return;
    }

    const observable = this.precoServicoContratoService.getPrecoServicoContratoByContratoAndServico(cod_contrato, cod_servico, cod_reduzido);
    observable.subscribe(
      (result) => {

        if (result.length > 0) {
          this.precoServicoContrato = result[0];

          this.getParametrosCampos(this.precoServicoContrato);
          this.getFrequencias(this.precoServicoContrato.coD_Servico, this.precoServicoContrato.coD_CONTRATOREDUZIDO);

        } else {
          this.message = 'Não foi encontrado resultados';
          this.errorMessage = true;
        }
      },
      (error) => { console.log(error); }
    );
  }

  servicosContratoFilter(filter: string) {
    
  if(this.servicosContrato.length > 0){

    if(this.servicesFiltered.length == 0){
        var groups = new Set(this.servicosContrato.map(item => item.id_Servico));
        
        groups.forEach(g => {

          this.servicesFiltered.push(this.servicosContrato.filter(i => i.id_Servico === g)[0]) 
        }
        );
    }

      if (!filter) {

        return this.servicesFiltered
      }

      return this.servicesFiltered.filter(
        (servicoContrato) => servicoContrato.deS_ServicoLabel
          .toLowerCase()
          .indexOf(filter.toLocaleLowerCase()) > -1
      );
    }
  }

  servicosContratoPorServicoFilter(codServico: number) {
    if (codServico == 0) {
      return this.servicosContrato;
    }

    return this.servicosContrato.filter(
      (scs) => scs.id_Servico == codServico
    );
  }

  public getFrequencias(codServico: number, codContratoReduzido: number) {

    const filtro = {
      cod_Servico: codServico,
      cod_ContratoReduzido: codContratoReduzido
    };

    const observable = this.precoFrequenciaService.filter(filtro);
    observable.subscribe(
      (result) => {
        this.precoServicoContrato.precoFrequencias = result;
      },
      (error) => { console.log(error); }
    );
  }

  public getParametrosCampos(precoServicoContrato: PrecoServicoContrato) {

    const familiaproduto = precoServicoContrato.coD_FamiliaProduto;
    const produto = precoServicoContrato.coD_Produto;
    const servico = precoServicoContrato.coD_Servico;

    const filtro = {
      cod_familiaproduto: familiaproduto,
      cod_produto: produto,
      cod_servico: servico
    };

    const observable = this.parametroCampoService.filter(filtro);
    observable.subscribe(
      (result) => {

        if (result.length > 0) {
          this.parametrosCampos = result;
          this.parametrosCamposTelaOcultar(this.parametrosCampos);
        } else {
          this.message = 'Não foi encontrado resultados';
          this.parametrosCamposTelaExibir(this.parametrosCampos);
        }
      },
      (error) => { console.log(error); }
    );
  }

  parametrosCamposTelaOcultar(parametros: ParametroCampo[]) {
    const cadastroServicos = document.getElementById('cadastroServicos');
    const elementsCadastroServicos = cadastroServicos.getElementsByTagName('*');
    const elementsArrayCadastroServicos = Array.from(elementsCadastroServicos);

    elementsArrayCadastroServicos.forEach(element => {
      parametros.forEach(parametro => {
        if (element.id != undefined) {
          if (element.id != "") {
            if (parametro.des_IdentificadorHTML === element.id) {
              element.classList.add('ocultar');
            }
          }
        }
      });
    });
  }

  parametrosCamposTelaExibir(parametros: ParametroCampo[]) {
    const cadastroServicos = document.getElementById('cadastroServicos');
    const elementsCadastroServicos = cadastroServicos.getElementsByTagName('*');
    const elementsArrayCadastroServicos = Array.from(elementsCadastroServicos);

    elementsArrayCadastroServicos.forEach(element => {
      parametros.forEach(parametro => {
        if (element.id != undefined) {
          if (element.id != "") {
            if (parametro.des_IdentificadorHTML != element.id) {
              element.classList.remove('ocultar');
            }
          }
        }
      });
    });
  }

}
