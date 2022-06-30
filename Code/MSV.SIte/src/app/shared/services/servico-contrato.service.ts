
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ServicePoint } from '../entities/service-point';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { ServicoContrato } from '../entities/servico-contrato';
import { Observable } from 'rxjs';

@Injectable()
export class ServicoContratoService extends HttpBaseService<ServicoContrato> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.servicoscontrato, environment.api);
  }

  public getServicosByContrato(codContrato: number, id_ContratoPontoAtendimento: number): Observable<ServicoContrato[]> {
    const uri = `${this.defaultUri}${this.resource.default}/${codContrato}/${id_ContratoPontoAtendimento}`;

    return this.http
      .get<ServicoContrato[]>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }
}
