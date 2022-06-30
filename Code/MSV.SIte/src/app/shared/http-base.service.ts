import { HttpService } from './http.service';
import { APIConfig } from '../app.config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

export abstract class HttpBaseService<T> extends HttpService {
  public header = APIConfig.header;
  protected defaultUri: string;
  protected resource = {
    default: ''
  };

  constructor(
    http: HttpClient,
    resource: any,
    defaultUri: string
  ) {
    super(http);

    this.defaultUri = defaultUri;
    this.resource = resource;
  }

  public add(input: T): Observable<T> {
    const uri = `${this.defaultUri}${this.resource.default}`;

    return this.http
      .post<T>(
        uri,
        input,
        this.getRequestOptions(this.header.contentType.json)
      );
  }

  public delete(id: number): Observable<any> {
    const uri = `${this.defaultUri}${this.resource.default}/${id}`;

    return this.http
      .delete(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }

  public get(id: number): Observable<T> {
    const uri = `${this.defaultUri}${this.resource.default}/${id}`;

    return this.http
      .get<T>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }

  public list(): Observable<T[]> {
    const uri = `${this.defaultUri}${this.resource.default}`;

    return this.http
      .get<T[]>(
        uri,
        this.getRequestOptions(this.header.contentType.json)
      );
  }

  public filter(filter: any): Observable<T[]> {
    const uri = `${this.defaultUri}${this.resource.default}/filter`;

    const requestOptions = Object.assign({ }, this.getRequestOptions(this.header.contentType.json));

    return this.http
      .post<T[]>(
        uri,
        filter,
        requestOptions
      );
  }

  public update(id: number, input: T): Observable<T> {
    const uri = `${this.defaultUri}${this.resource.default}/${id}`;

    return this.http
      .put<T>(
        uri,
        input,
        this.getRequestOptions(this.header.contentType.json)
      );
  }
}
