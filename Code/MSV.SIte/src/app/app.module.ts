import { BrowserModule } from '@angular/platform-browser';
import { NgModule, APP_INITIALIZER } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgHttpLoaderModule } from 'ng-http-loader';
import { TypeaheadModule } from 'ngx-bootstrap';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { BsDatepickerModule } from 'ngx-bootstrap/datepicker';
import { ModalModule } from 'ngx-bootstrap/modal';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { AppService } from './app.service';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { NgxMaskModule } from 'ngx-mask';
import { TabsModule } from 'ngx-bootstrap/tabs';

export function startupServiceFactory(startupService: AppService) {
  return () => startupService.load();
}

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    HttpClientModule,
    NgHttpLoaderModule.forRoot(),
    BrowserModule,
    FormsModule,
    TypeaheadModule.forRoot(),
    BrowserAnimationsModule,
    BsDatepickerModule.forRoot(),
    ModalModule.forRoot(),
    TooltipModule.forRoot(),
    ModalModule.forRoot(),
    AppRoutingModule,
    NgxMaskModule.forRoot(),
    TabsModule.forRoot()
  ],
  providers: [
    AppService,
    { provide: APP_INITIALIZER, useFactory: startupServiceFactory, deps: [AppService], multi: true }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
