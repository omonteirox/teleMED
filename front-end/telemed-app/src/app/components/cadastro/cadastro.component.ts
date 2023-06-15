import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro',
  templateUrl: './cadastro.component.html',
  styleUrls: ['./cadastro.component.css'],
})
export class CadastroComponent {
  novoUsuario = {
    email: '',
    name: '',
    password: '',
    roles: new Set<string>()
  };

  constructor(private router: Router, private authService: AuthService) {}
  
  register() {
    this.novoUsuario.roles.add('1');
  
    const rolesArray = Array.from(this.novoUsuario.roles); // Converte o conjunto para um array
  
    this.authService
      .register(
        this.novoUsuario.email,
        this.novoUsuario.name,
        this.novoUsuario.password,
        rolesArray
      )
      .subscribe(
        (response: any) => {
          this.router.navigate([''], {
            state: { message: 'Cadastro realizado com sucesso!' },
          });
        },
        (error: any) => {
          // Lógica para lidar com erros no registro
        }
      );
  }
}
