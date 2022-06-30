
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { Observable } from 'rxjs';
import { PrecoFrequencia } from '../entities/preco-frequencia';


@Injectable()
export class PrecoFrequenciaService extends HttpBaseService<PrecoFrequencia> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.precoFrequencia, environment.api);
  }

  // public getPrecoFrequencia(codServico: number, codContratoReduzido: number): Observable<PrecoFrequencia[]> {

  //   const uri = `${this.defaultUri}${this.resource.default}/${codServico}/${codContratoReduzido}`;

  //   return this.http
  //     .get<PrecoFrequencia[]>(
  //       uri,
  //       this.getRequestOptions(this.header.contentType.json)
  //     );
  // }

}
