
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { Observable } from 'rxjs';
import { PrecoServicoContrato } from '../entities/preco-servico-contrato';


@Injectable()
export class PrecoServicoContratoService extends HttpBaseService<PrecoServicoContrato> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.precoservicocontrato, environment.api);
  }

  public getPrecoServicoContratoByContratoAndServico(codContrato: number, codServico: number, codReduzido: number): Observable<PrecoServicoContrato[]> {

    let uri = '';
    if (codReduzido) {
      uri = `${this.defaultUri}${this.resource.default}/${codContrato}/${codServico}/${codReduzido}`;
    } else {
      uri = `${this.defaultUri}${this.resource.default}/${codContrato}/${codServico}`;
    }

    return this.http
      .get<PrecoServicoContrato[]>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }

}
