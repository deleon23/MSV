
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { Entidade } from '../entities/entity';
import { Observable } from 'rxjs';

@Injectable()
export class EntityService extends HttpBaseService<Entidade> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.entity, environment.api);
  }

  public getSubclientes(): Observable<Entidade[]> {
    const uri = `${this.defaultUri}${this.resource.default}/subcliente`;

    return this.http
      .get<Entidade[]>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }

  public getClientes(): Observable<Entidade[]> {
    const uri = `${this.defaultUri}${this.resource.default}/cliente`;

    return this.http
      .get<Entidade[]>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }

  public getSubclienteByClient(codEntidade: number): Observable<Entidade[]> {
    const uri = `${this.defaultUri}${this.resource.default}/${codEntidade}`;

    return this.http
      .get<Entidade[]>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }
}
