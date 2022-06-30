import {
  Component,
  Input,
  Output,
  EventEmitter,
  TemplateRef,
  ContentChild,
  OnChanges,
  SimpleChanges
} from '@angular/core';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})
export class ListComponent implements OnChanges {

  @Input() items: any[];

  @Input() showEdit: boolean;

  @Input() showDelete: boolean;

  @Input() showDetails: boolean;

  @Input() editText: string;

  @Input() deleteText: string;

  @Input() emptyDataText: string;

  @Input() isSmall: boolean;

  @Input() noBorder: boolean;

  @Input() isPrintable: boolean;

  @Input() lazyLoad: boolean;

  @Output() edit: EventEmitter<any> = new EventEmitter();

  @Output() delete: EventEmitter<any> = new EventEmitter();

  @Output() detail: EventEmitter<boolean> = new EventEmitter();

  @ContentChild(TemplateRef,  {static: false})
  @Input()
  layoutTemplate: TemplateRef<any>;

  toggleDetail: boolean;
  listItems: any[];

  constructor() {
    this.items = [];

    this.showDelete = false;
    this.showDetails = false;
    this.showEdit = false;
    this.toggleDetail = false;
  }

  ngOnChanges(changes: SimpleChanges): void {
    this.fillListItems(changes.items.currentValue);
  }

  fillListItems(items: any): any {
    this.listItems = [];

    if (!this.lazyLoad) {
      this.listItems = items;
      return;
    }

    if (items.length <= 100) {
      this.listItems = items;
      return;
    }

    this.listItems = this.listItems.concat(items.slice(0, 100));
  }

  editItem(item: any): void {
    this.edit.emit(item);
  }

  deleteItem(item: any): void {
    this.delete.emit(item);
  }

  expandItem(item: any, expanded: boolean): void {
    item.details = !item.details;
    this.detail.emit(expanded);
  }
}
