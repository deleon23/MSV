
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { ParametroCampo } from '../entities/parametro-campo';

@Injectable()
export class ParametroCampoService extends HttpBaseService<ParametroCampo> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.parametrocampo, environment.api);
  }
}
