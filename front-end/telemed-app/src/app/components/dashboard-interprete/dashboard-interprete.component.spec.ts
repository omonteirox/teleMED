import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardInterpreteComponent } from './dashboard-interprete.component';

describe('DashboardInterpreteComponent', () => {
  let component: DashboardInterpreteComponent;
  let fixture: ComponentFixture<DashboardInterpreteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DashboardInterpreteComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DashboardInterpreteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
