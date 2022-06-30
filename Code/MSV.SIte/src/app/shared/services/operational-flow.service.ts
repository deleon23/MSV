
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { FluxoOperacional } from '../entities/operational-flow';

@Injectable()
export class OperationalFlowService extends HttpBaseService<FluxoOperacional> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.operationalFlow, environment.api);
  }
}
