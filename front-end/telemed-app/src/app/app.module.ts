import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatIconModule } from '@angular/material/icon';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatButtonModule } from '@angular/material/button';
import { MatDividerModule } from '@angular/material/divider';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { CadastroComponent } from './components/cadastro/cadastro.component';
import { DashboardPacienteComponent } from './components/dashboard-paciente/dashboard-paciente.component';
import { DashboardInterpreteComponent } from './components/dashboard-interprete/dashboard-interprete.component';
import { DashboardMedicoComponent } from './components/dashboard-medico/dashboard-medico.component';
import { HeaderComponent } from './components/header/header.component';
import { HttpClientModule } from '@angular/common/http';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AvisoComponent } from './components/aviso/aviso.component';
import { ConsultasComponent } from './components/consultas/consultas.component';
import { ChamadaComponent } from './components/chamada/chamada.component';
import { AtestadosComponent } from './components/atestados/atestados.component';
import { InfoconsultaComponent } from './components/infoconsulta/infoconsulta.component';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    DashboardPacienteComponent,
    DashboardInterpreteComponent,
    DashboardMedicoComponent,
    HeaderComponent,
    DashboardComponent,
    CadastroComponent,
    AvisoComponent,
    ConsultasComponent,
    ChamadaComponent,
    AtestadosComponent,
    InfoconsultaComponent

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    MatIconModule,
    MatSidenavModule,
    MatButtonModule,
    MatDividerModule,
    MatFormFieldModule,
    MatCheckboxModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
