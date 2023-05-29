import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardMedicoComponent } from './dashboard-medico.component';

describe('DashboardMedicoComponent', () => {
  let component: DashboardMedicoComponent;
  let fixture: ComponentFixture<DashboardMedicoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DashboardMedicoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DashboardMedicoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
