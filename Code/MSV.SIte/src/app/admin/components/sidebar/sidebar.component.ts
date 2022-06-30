import { Component, OnInit, Input, SimpleChanges, OnChanges } from '@angular/core';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit, OnChanges {
  isAdmin: boolean;
  checkValues: boolean;
  consultTerm: boolean;
  valuesTransportation: boolean;

  @Input() collapsed: boolean;

  @Input() menuItens: any[];

  versionNumber: string;

  constructor() {
    this.collapsed = false;
    this.menuItens = [];
  }

  ngOnInit() {
    this.versionNumber = '2019.08.01.14.00';
  }

  ngOnChanges(changes: SimpleChanges) {
    this.collapsed = changes.collapsed.currentValue;
  }

}
