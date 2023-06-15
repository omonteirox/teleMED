import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router'
import { AuthService } from '../../services/auth.service';
;

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  isLoggedIn: boolean = false; // Variável para controlar o estado de autenticação

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit() {
    // Lógica para verificar o estado de autenticação (exemplo)
    this.isLoggedIn = this.checkIfLoggedIn();
  }

  logout(): void {
    this.authService.logout(); // Chama o método de logout do serviço AuthService
  }

  private checkIfLoggedIn(): boolean {
    // Lógica para verificar se o usuário está autenticado (exemplo)
    // Aqui você pode acessar informações do serviço de autenticação para verificar o estado de autenticação
    // Por exemplo, você pode verificar se há um token de autenticação válido no armazenamento local
    // Retorne true se estiver autenticado, caso contrário, retorne false

    // Exemplo simples de verificação de estado de autenticação falso
    return false;
  }
}
