import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../environments/environment';
import { AppContext } from './shared/app.context';

@Injectable()
export class AppService {
  private _appContext: AppContext;

  get context(): AppContext {
    return this._appContext;
  }

  constructor(private httpClient: HttpClient) {}

  load(): Promise<any> {
    this._appContext = null;
    return this.httpClient
      .get('../webconfig.json')
      .toPromise()
      .then((res: any) => {
        environment.api = res.urlApi;
      })
      .catch((err) => console.log(err));
  }
}
