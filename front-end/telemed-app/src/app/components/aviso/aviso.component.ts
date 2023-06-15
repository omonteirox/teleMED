import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';


@Component({
  selector: 'app-aviso',
  templateUrl: './aviso.component.html',
  styleUrls: ['./aviso.component.css']
})
export class AvisoComponent {

  constructor(private authService: AuthService) {}

  ngOnInit() {}
  
  shouldShowHeader(): boolean {
    // Lógica para determinar se o cabeçalho deve ser exibido neste componente
    // Por exemplo, se houver um estado específico que indique que o cabeçalho deve ser exibido
    return true; // Modifique a lógica conforme necessário
  }

  logout(): void {
    this.authService.logout(); // Chama o método de logout do serviço AuthService
  }

}
