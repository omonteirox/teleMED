import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { CadastroComponent } from './components/cadastro/cadastro.component';
import { DashboardInterpreteComponent } from './components/dashboard-interprete/dashboard-interprete.component';
import { DashboardPacienteComponent } from './components/dashboard-paciente/dashboard-paciente.component';
import { DashboardMedicoComponent } from './components/dashboard-medico/dashboard-medico.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'cadastro', component: CadastroComponent },
  { path: 'DashboardInterprete', component: DashboardInterpreteComponent },
  { path: 'DashboardPaciente', component: DashboardPacienteComponent },
  { path: 'DashboardMedico', component: DashboardMedicoComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
