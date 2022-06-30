import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminComponent } from './admin.component';
import { CustomerSearchComponent } from './customer-search/customer-search.component';
import { ServiceRegistrationComponent } from './service-registration/service-registration.component';

const routes: Routes = [
  {
    path: '',
    component: AdminComponent,
    data: { breadcrumb: 'Início' },
    children: [
      {
        path: 'customer-search',
        component: CustomerSearchComponent
      },
      {
        path: 'service-registration',
        component: ServiceRegistrationComponent
      }
    ]
    // children: [
    //   {
    //     path: 'home',
    //     loadChildren: './report/report.module#ReportModule',
    //     data: { breadcrumb: 'Relatórios' }
    //   },
    //   {
    //     path: 'administrative-user',
    //     loadChildren: './administrative-user/administrative-user.module#AdministrativeUserModule',
    //     data: { breadcrumb: 'Gestão de Administradores' },
    //   },
    //   {
    //     path: 'customer-user',
    //     loadChildren: './customer-user/customer-user.module#CustomerUserModule',
    //     data: { breadcrumb: 'Gestão de Logins' }
    //   },
    //   {
    //     path: 'report',
    //     loadChildren: './report/report.module#ReportModule',
    //     data: { breadcrumb: 'Relatórios' }
    //   }
    // ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AdminRoutingModule { }
