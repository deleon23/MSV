import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CustomerSearchComponent } from './customer-search.component';
import { FormsModule } from '@angular/forms';
import { TypeaheadModule, AccordionModule } from 'ngx-bootstrap';
import { ComponentsModule } from '../components/components.module';
import { RouterModule } from '@angular/router';
import { CompanyService } from '../../shared/services/company.service';
import { BranchService } from '../../shared/services/branch.service';
import { EntityService } from '../../shared/services/entity.service';
import { FamilyProductService } from '../../shared/services/family-product.service';
import { SubClientTypeService } from '../../shared/services/subclient-type.service';
import { SubClientContractService } from 'src/app/shared/services/subclient-contract.service';
import { ServicePointService } from 'src/app/shared/services/service-point.service';
import { NgxMaskModule } from 'ngx-mask';

@NgModule({
  declarations: [CustomerSearchComponent],
  imports: [
    CommonModule,
    FormsModule,
    TypeaheadModule.forRoot(),
    AccordionModule.forRoot(),
    ComponentsModule,
    RouterModule,
    NgxMaskModule.forRoot()
  ],
  providers: [
    CompanyService,
    BranchService,
    EntityService,
    FamilyProductService,
    SubClientTypeService,
    SubClientContractService,
    ServicePointService
  ]
})
export class CustomerSearchModule { }
