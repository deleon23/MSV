import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ServiceRegistrationComponent } from './service-registration.component';
import { FormsModule } from '@angular/forms';
import { ComponentsModule } from '../components/components.module';
import { AccordionModule, BsDatepickerModule, ModalModule, TooltipModule, TypeaheadModule, BsDropdownModule, BsModalRef, TabsModule } from 'ngx-bootstrap';
import { RouterModule } from '@angular/router';
import { ServiceComponent } from './service/service.component';
import { ValueComponent } from './value/value.component';
import { ManageAddressesComponent } from './service/modal/manage-addresses/manage-addresses.component';
import { EquipmentsComponent } from './value/modal/equipments/equipments.component';
import { RulesComponent } from './value/modal/rules/rules.component';
import { AttributesComponent } from './modal/attributes/attributes.component';
import { BankDetailsComponent } from './modal/bank-details/bank-details.component';
import { ContractComponent } from './modal/contract/contract.component';
import { ReducedCodeComponent } from './modal/reduced-code/reduced-code.component';
import { ServicePointComponent } from './modal/service-point/service-point.component';
import { CustomerInformationComponent } from './customer-information/customer-information.component';
import { ServicoContrato } from 'src/app/shared/entities/servico-contrato';
import { ServicoContratoService } from 'src/app/shared/services/servico-contrato.service';
import { ServicePointOriginService } from 'src/app/shared/services/service-point-origin.service';
import { PrecoServicoContratoService } from 'src/app/shared/services/preco-servico-contrato.service';
import { ParametroCampoService } from 'src/app/shared/services/parametro-campo.service';
import { NgxMaskModule } from 'ngx-mask';
import { PrecoFrequenciaService } from 'src/app/shared/services/preco-frequencia.service';
import { OperationalFlowService } from 'src/app/shared/services/operational-flow.service';



@NgModule({
  declarations: [
    ServiceRegistrationComponent,
    ContractComponent,
    ServiceComponent,
    ValueComponent,
    AttributesComponent,
    ManageAddressesComponent,
    BankDetailsComponent,
    EquipmentsComponent,
    RulesComponent,
    ReducedCodeComponent,
    ServicePointComponent,
    CustomerInformationComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ComponentsModule,
    AccordionModule.forRoot(),
    RouterModule,
    BsDatepickerModule.forRoot(),
    ModalModule.forRoot(),
    TooltipModule.forRoot(),
    TypeaheadModule.forRoot(),
    BsDropdownModule.forRoot(),
    ModalModule.forRoot(),
    NgxMaskModule.forRoot(),
    TabsModule.forRoot()
  ],
  exports: [
    ContractComponent,
    AttributesComponent,
    ManageAddressesComponent,
    BankDetailsComponent,
    EquipmentsComponent,
    RulesComponent,
    ReducedCodeComponent,
    ServicePointComponent
  ],
  entryComponents: [
    ContractComponent,
    AttributesComponent,
    ManageAddressesComponent,
    BankDetailsComponent,
    EquipmentsComponent,
    RulesComponent,
    ReducedCodeComponent,
    ServicePointComponent
  ],
  providers: [
    ServicoContratoService,
    ServicePointOriginService,
    BsModalRef,
    PrecoServicoContratoService,
    ParametroCampoService,
    PrecoFrequenciaService,
    OperationalFlowService
  ]

})
export class ServiceRegistrationModule { }
