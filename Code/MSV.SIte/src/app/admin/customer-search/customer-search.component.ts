import { Component, OnInit } from '@angular/core';
import { CompanyService } from '../../shared/services/company.service';
import { Empresa } from '../../shared/entities/company';
import { BranchService } from '../../shared/services/branch.service';
import { Filial } from '../../shared/entities/branch';
import { EntityService } from '../../shared/services/entity.service';
import { Entidade } from '../../shared/entities/entity';
import { FamilyProductService } from '../../shared/services/family-product.service';
import { FamiliaProduto } from '../../shared/entities/family-product';
import { SubClientTypeService } from '../../shared/services/subclient-type.service';
import { TipoSubCliente } from '../../shared/entities/subclient-type';
import { SubClientContractService } from 'src/app/shared/services/subclient-contract.service';
import { ContratoSubCliente } from 'src/app/shared/entities/subclient-contract';
import { SearchFilter } from 'src/app/shared/entities/search-filter';
import { Router, NavigationExtras } from '@angular/router';
import { ServiceRegistrationComponent } from '../service-registration/service-registration.component';
import { BsModalService } from 'ngx-bootstrap';

@Component({
  selector: 'app-customer-search',
  templateUrl: './customer-search.component.html',
  styleUrls: ['./customer-search.component.scss']
})
export class CustomerSearchComponent implements OnInit {
  isOpen = true;
  mostrarResultados = false;
  empresa: string;
  filial: string;
  codReduzido: number;
  contrato: number;
  cliente: string;
  aditivo: string;
  subCliente: string;
  exibirInativos = false;
  selectedFamilia: FamiliaProduto;

  filtroEmpresa: Empresa;
  filtroFilial: Filial;
  filtroCliente: Entidade;
  filtroSubcliente: Entidade;

  empresas: Empresa[];
  filiais: Filial[];
  clientes: Entidade[];
  subClientes: Entidade[];
  familiasProduto = new Array<FamiliaProduto>();
  subclientTypes: TipoSubCliente[];

  contratosSubclientes: ContratoSubCliente[];

  constructor(
    private companyService: CompanyService,
    private branchService: BranchService,
    private entityService: EntityService,
    private familyProductService: FamilyProductService,
    private subclientTypeService: SubClientTypeService,
    private subClientContractService: SubClientContractService,
    private router: Router
    ) { }

  ngOnInit() {
    this.companyService.list()
      .subscribe(
        (result) => {
          this.empresas = result;
        },
        (error) => { console.log(error); }
    );

    this.branchService.list()
      .subscribe(
        (result) => {
          this.filiais = result;
        },
        (error) => { console.log(error); }
    );

    this.entityService.getClientes()
      .subscribe(
        (result) => {
          this.clientes = result;
        },
        (error) => { console.log(error); }
    );

    this.entityService.getSubclientes()
      .subscribe(
        (result) => {
          this.subClientes = result;
        },
        (error) => { console.log(error); }
    );

    this.familyProductService.list()
      .subscribe(
        (result) => {
          this.familiasProduto.push({ id: 0, nom_FamiliaProduto: 'Todos'});
          result.forEach(familia => {
            this.familiasProduto.push(familia);
          });
          this.selectedFamilia = this.familiasProduto[0];
        },
        (error) => { console.log(error); }
    );

    this.subclientTypeService.list()
      .subscribe(
        (result) => {
          this.subclientTypes = result;
        },
        (error) => { console.log(error); }
    );
  }

  cancel() {
    this.codReduzido = undefined;
    this.contrato = undefined;
    this.aditivo = undefined;
    this.subCliente = undefined;
    this.empresa = undefined;
    this.filial = undefined;
    this.cliente = undefined;
    this.exibirInativos = false;
    this.selectedFamilia = this.familiasProduto[0];
    this.filtroEmpresa = undefined;
    this.filtroFilial = undefined;
    this.filtroCliente = undefined;
    this.filtroSubcliente = undefined;
    this.mostrarResultados = false;
  }

  search() {

    const filter = new SearchFilter();

    filter.campoOrdenacao = 'Contrato ASC';
    filter.tamanhoPagina = 50;
    filter.paginaAtual = 1;
    filter.flg_ExibeInativos = this.exibirInativos;

    if (this.filtroCliente && this.cliente) {
      filter.cod_ClienteEntidade = this.filtroCliente.id;
    }

    if (this.filtroSubcliente && this.subCliente) {
      filter.cod_SubClienteEntidade = this.filtroSubcliente.id;
    }

    if (this.filtroFilial && this.filial) {
      filter.cod_Regional = this.filtroFilial.cod_Regional;
      filter.cod_Filial = this.filtroFilial.id;
    }

    if (this.filtroEmpresa && this.empresa) {
      filter.cod_Empresa = this.filtroEmpresa.id;
    }

    if (this.codReduzido) {
      filter.cod_Reduzido = this.codReduzido;
    }

    if (this.contrato) {
      filter.cod_Contrato = this.contrato;
    }

    if (this.selectedFamilia && this.selectedFamilia.id !== 0) {
      filter.cod_Familia = this.selectedFamilia.id;
    }

    this.subClientContractService.filter(filter)
      .subscribe(
        (result) => {
          this.contratosSubclientes = result;
          this.mostrarResultados = true;
        },
        (error) => { console.log(error); }
    );
  }

  typeaheadOnSelectEmpresa($event) {
    this.filtroEmpresa = $event.item;

    this.branchService.getBranchByCompany(this.filtroEmpresa.id)
      .subscribe(
        (result) => {
          this.filiais = result;
        },
        (error) => { console.log(error); }
    );
  }

  typeaheadOnSelectFilial($event) {
    this.filtroFilial = $event.item;
  }

  typeaheadOnSelectCliente($event) {
    this.filtroCliente = $event.item;

    this.entityService.getSubclienteByClient(this.filtroCliente.id)
      .subscribe(
        (result) => {
          this.subClientes = result;
        },
        (error) => { console.log(error); }
    );
  }

  typeaheadOnSelectSubcliente($event) {
    this.filtroSubcliente = $event.item;
  }

  public showDetails(item: ContratoSubCliente): void {

    // alert('item.reduzido:'  + item.reduzido + ' | item.contrato:'  + item.contrato)

    if (!item.contrato){
      alert('Necessario Contrato !'  + item.contrato)
      return;
    }else{

      //passa parametros na rota
      let navigationExtras: NavigationExtras = {
        queryParams: item
      };
      this.router.navigate(['service-registration'],
        {queryParams: item});

    }

  }
}
