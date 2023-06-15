import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { CadastroComponent } from './components/cadastro/cadastro.component';
import { DashboardInterpreteComponent } from './components/dashboard-interprete/dashboard-interprete.component';
import { DashboardPacienteComponent } from './components/dashboard-paciente/dashboard-paciente.component';
import { DashboardMedicoComponent } from './components/dashboard-medico/dashboard-medico.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { AtestadosComponent } from './components/atestados/atestados.component';
import { AvisoComponent } from './components/aviso/aviso.component';
import { ChamadaComponent } from './components/chamada/chamada.component';
import { ConsultasComponent } from './components/consultas/consultas.component';
import { AuthGuard } from './services/auth.guard';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'cadastro', component: CadastroComponent },
  {
    path: 'dashboardInterprete',
    component: DashboardInterpreteComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'dashboardPaciente',
    component: DashboardPacienteComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'dashboardMedico',
    component: DashboardMedicoComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'atestados',
    component: AtestadosComponent,
    canActivate: [AuthGuard],
  },
  { path: 'chamada', component: ChamadaComponent, canActivate: [AuthGuard] },
  { path: 'aviso', component: AvisoComponent, canActivate: [AuthGuard] },
  { path: 'consulta', component: ConsultasComponent, canActivate: [AuthGuard] },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
