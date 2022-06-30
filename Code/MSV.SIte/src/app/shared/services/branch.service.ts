
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { Filial } from '../entities/branch';
import { Observable } from 'rxjs';

@Injectable()
export class BranchService extends HttpBaseService<Filial> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.branch, environment.api);
  }

  public getBranchByCompany(codEmpresa: number): Observable<Filial[]> {
    const uri = `${this.defaultUri}${this.resource.default}/${codEmpresa}`;

    return this.http
      .get<Filial[]>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }
}
