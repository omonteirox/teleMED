import { Component } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro',
  templateUrl: './cadastro.component.html',
  styleUrls: ['./cadastro.component.css']
})
export class CadastroComponent {
  novoUsuario = {
    nome: '',
    email: '',
    senha: ''
  };

  constructor(private authService: AuthService) { }


}
