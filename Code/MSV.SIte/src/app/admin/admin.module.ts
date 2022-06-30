import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminComponent } from './admin.component';
import { AdminRoutingModule } from './admin-routing.module';
import { TypeaheadModule, AccordionModule } from 'ngx-bootstrap';
import { FormsModule } from '@angular/forms';
import { ServiceRegistrationModule } from './service-registration/service-registration.module';
import { ComponentsModule } from './components/components.module';
import { CustomerSearchModule } from './customer-search/customer-search.module';
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [
    CommonModule,
    AdminRoutingModule,
    TypeaheadModule.forRoot(),
    FormsModule,
    AccordionModule.forRoot(),
    ServiceRegistrationModule,
    CustomerSearchModule,
    ComponentsModule,
    RouterModule
  ],
  declarations: [AdminComponent]
})
export class AdminModule { }
