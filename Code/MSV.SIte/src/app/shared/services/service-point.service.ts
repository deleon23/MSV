
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ServicePoint } from '../entities/service-point';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';

@Injectable()
export class ServicePointService extends HttpBaseService<ServicePoint> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.servicepoint, environment.api);
  }
}
