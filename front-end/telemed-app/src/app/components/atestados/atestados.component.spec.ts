import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AtestadosComponent } from './atestados.component';

describe('AtestadosComponent', () => {
  let component: AtestadosComponent;
  let fixture: ComponentFixture<AtestadosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AtestadosComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AtestadosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
