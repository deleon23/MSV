
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpBaseService } from '../http-base.service';
import { environment } from '../../../environments/environment';
import { APIConfig } from '../../app.config';
import { FamiliaProduto } from '../entities/family-product';

@Injectable()
export class FamilyProductService extends HttpBaseService<FamiliaProduto> {
  constructor(public http: HttpClient) {
    super(http, APIConfig.resources.familyProduct, environment.api);
  }
}
