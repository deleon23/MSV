
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Empresa } from '../entities/company';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';

@Injectable()
export class CompanyService extends HttpBaseService<Empresa> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.company, environment.api);
  }
}
