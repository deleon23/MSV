import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { SidebarService } from '../../../shared/services/sidebar.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  collapsed: boolean;
  userName: string;

  @Output() collapsedEvent = new EventEmitter<boolean>();

  versionNumber: string;

  constructor(
    private sidebarService: SidebarService
  ) { }

  ngOnInit() {
    window.addEventListener('resize', (event: any) => this.collapseOnResize(event.target));
    this.collapseOnResize(window);
    this.versionNumber = '2018.10.11.14.22';

    this.sidebarService.collapsed.subscribe(
      (value) => {
        if (!this.collapsed) {
          this.toggleCollapsed();
        }
      }
    );
  }

  toggleCollapsed() {
    this.collapsed = !this.collapsed;
    this.collapsedEvent.emit(this.collapsed);
  }

  collapseOnResize(currentWindow: any) {
    if (currentWindow.innerWidth < 1023 && !this.collapsed) {
      this.toggleCollapsed();
    }
    if (currentWindow.innerWidth >= 1023 && this.collapsed) {
      this.toggleCollapsed();
    }
  }

}
