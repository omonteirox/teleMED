import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(): boolean {
    if (this.authService.isLoggedIn()) {
      return true; // O acesso ao componente é permitido
    } else {
      this.router.navigate(['/login']); // Redireciona para a página de login
      return false; // O acesso ao componente é negado
    }
  }
}
