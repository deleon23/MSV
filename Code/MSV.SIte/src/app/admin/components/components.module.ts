import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { ListComponent } from './list/list.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { SidebarService } from '../../shared/services/sidebar.service';
import { RouterModule } from '@angular/router';
import { TooltipModule } from 'ngx-bootstrap';



@NgModule({
  declarations: [HeaderComponent, ListComponent, SidebarComponent],
  imports: [
    CommonModule,
    RouterModule,
    TooltipModule.forRoot(),
  ],
  exports: [HeaderComponent, SidebarComponent, ListComponent],
  providers: [SidebarService]
})
export class ComponentsModule { }
