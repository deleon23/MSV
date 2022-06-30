
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ServicePoint } from '../entities/service-point';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { Observable } from 'rxjs';
import { ServicePointOrigin } from '../entities/service-point-origin';

@Injectable()
export class ServicePointOriginService extends HttpBaseService<ServicePointOrigin> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.pontoatendimentoorigem, environment.api);
  }

  public getServicePointsOriginByContrato(codContrato: number, id_ContratoPontoAtendimento: number): Observable<ServicePointOrigin[]> {
    const uri = `${this.defaultUri}${this.resource.default}/${codContrato}/${id_ContratoPontoAtendimento}`;

    return this.http
      .get<ServicePointOrigin[]>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }

}
