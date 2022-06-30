import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable()
export abstract class HttpService {

    constructor(
        public http: HttpClient
    ) { }

    protected serialize(obj: any, prefix?: any): string {
        const str = [];
        let p;
        for (p in obj) {
            if (obj.hasOwnProperty(p)) {
                const k = prefix ? prefix + '.' + p : p, v = obj[p];
                str.push((v !== null && typeof v === 'object') ?
                    this.serialize(v, k) :
                    encodeURIComponent(k) + '=' + encodeURIComponent(v));
            }
        }
        return str.join('&');
    }

    protected getRequestOptions(contentType?: string, responseType?: string) {
      const headers = new HttpHeaders();

      if (contentType != null && contentType !== undefined && contentType !== '') {
          headers.append('Content-Type', contentType);
      }

      if (responseType != null && responseType !== undefined && responseType !== '') {
          headers.append('Response-Type', responseType);
      }

      headers.append('Access-Control-Allow-Credentials', 'true');

      return { headers };
    }
}
