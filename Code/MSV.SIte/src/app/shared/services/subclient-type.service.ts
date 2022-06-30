
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { TipoSubCliente } from '../entities/subclient-type';

@Injectable()
export class SubClientTypeService extends HttpBaseService<TipoSubCliente> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.subclientType, environment.api);
  }
}
