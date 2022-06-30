import { Injectable, EventEmitter, Output } from '@angular/core';
import { BehaviorSubject, Observable, Observer, Subject } from 'rxjs';

@Injectable()
export class SidebarService {

  private collapsedSource = new Subject();
  collapsed = this.collapsedSource.asObservable();

  constructor() {
  }

  updateCollapsed(value: boolean) {
    this.collapsedSource.next(value);
    console.log('updateCollapsed');
    console.log(value);
  }
}
