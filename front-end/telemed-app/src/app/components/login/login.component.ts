import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  email: string = ''; // Atribui um valor inicial vazio
  password: string = ''; // Atribui um valor inicial vazio

  constructor(private authService: AuthService, private router: Router) {}

  onSubmit(): void {
    this.authService.login(this.email, this.password).subscribe(
      response => {
        // Lógica a ser executada em caso de login bem-sucedido
        console.log('Login realizado com sucesso:', response);
        this.router.navigate(['/dashboard']);
      },
      error => {
        // Lógica a ser executada em caso de erro de login
        console.error('Erro ao fazer login:', error);
      }
    );
  }
}