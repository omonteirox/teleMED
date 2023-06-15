import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InfoconsultaComponent } from './infoconsulta.component';

describe('InfoconsultaComponent', () => {
  let component: InfoconsultaComponent;
  let fixture: ComponentFixture<InfoconsultaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InfoconsultaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InfoconsultaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
