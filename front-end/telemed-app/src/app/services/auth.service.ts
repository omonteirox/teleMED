import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://15.229.86.202:8080';
  private loggedIn = false; // Variável para controlar o status de login

  constructor(private http: HttpClient, private router: Router) {
    this.checkAuthentication(); // Verifica o status de autenticação ao carregar o serviço
  }

  login(email: string, password: string): Observable<any> {
    const body = { email, password };
    return this.http.post<any>(`${this.apiUrl}/api/auth/signin`, body)
      .pipe(
        tap(() => {
          // Atualiza o status de login após o login bem-sucedido
          this.loggedIn = true;
          localStorage.setItem('isLoggedIn', 'true'); // Armazena o status de login no localStorage
        })
      );
  }

  logout(): void {
    // Limpa o status de login e redireciona o usuário para a tela inicial
    this.loggedIn = false;
    localStorage.removeItem('isLoggedIn'); // Remove o status de login do localStorage
    this.router.navigate(['/']);
  }

  private checkAuthentication(): void {
    // Verifica se o usuário está autenticado ao carregar o serviço
    const isLoggedIn = localStorage.getItem('isLoggedIn');
    this.loggedIn = isLoggedIn === 'true';
  }

  isLoggedIn(): boolean {
    return this.loggedIn; // Retorna true se o usuário estiver logado, caso contrário, retorna false
  }
}
