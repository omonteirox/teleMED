import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-dashboard-interprete',
  templateUrl: './dashboard-interprete.component.html',
  styleUrls: ['./dashboard-interprete.component.css']
})
export class DashboardInterpreteComponent implements OnInit {
  constructor() {}

  ngOnInit() {}

  shouldShowHeader(): boolean {
    // Lógica para determinar se o cabeçalho deve ser exibido neste componente
    // Por exemplo, se houver um estado específico que indique que o cabeçalho deve ser exibido
    return true; // Modifique a lógica conforme necessário
  }
}
