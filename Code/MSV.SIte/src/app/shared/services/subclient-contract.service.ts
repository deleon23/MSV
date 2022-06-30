
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { ContratoSubCliente } from '../entities/subclient-contract';

@Injectable()
export class SubClientContractService extends HttpBaseService<ContratoSubCliente> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.subclientContract, environment.api);
  }
}
