import { Component, ElementRef, ViewChild } from '@angular/core';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-chamada',
  templateUrl: './chamada.component.html',
  styleUrls: ['./chamada.component.css'],
})
export class ChamadaComponent {
  constructor(private authService: AuthService) {}

  @ViewChild('localVideo') localVideo!: ElementRef<HTMLVideoElement>;
  @ViewChild('remoteVideo') remoteVideo!: ElementRef<HTMLVideoElement>;

  localStream!: MediaStream;
  remoteStream!: MediaStream;
  peerConnection!: RTCPeerConnection;
  callStarted: boolean = false; // Flag para controlar o estado da chamada

  async ngOnInit() {
    await this.setupMediaDevices();
    this.configurePeerConnection();
  }

  async setupMediaDevices() {
    try {
      this.localStream = await navigator.mediaDevices.getUserMedia({
        video: true,
        audio: true,
      });
      this.localVideo.nativeElement.srcObject = this.localStream;
    } catch (error) {
      console.error('Erro ao obter acesso à câmera e ao microfone:', error);
    }
  }

  configurePeerConnection() {
    this.peerConnection = new RTCPeerConnection();

    // Configurar os tratadores de eventos do peer connection
    this.peerConnection.onicecandidate = (event) => {
      if (event.candidate) {
        // Enviar o candidato ICE para a outra pessoa na chamada
      }
    };

    this.peerConnection.ontrack = (event) => {
      this.remoteStream = event.streams[0];
      this.remoteVideo.nativeElement.srcObject = this.remoteStream;
    };
  }

  async startCall() {
    try {
      // Criar uma oferta (offer)
      const offer = await this.peerConnection.createOffer();

      // Definir a descrição local como a oferta criada
      await this.peerConnection.setLocalDescription(offer);

      // Enviar a oferta para a outra pessoa na chamada

      // Aguardar a resposta (answer) da outra pessoa na chamada

      // Definir a descrição remota como a resposta recebida

      this.callStarted = true; // Atualiza a flag para indicar que a chamada foi iniciada
    } catch (error) {
      console.error('Erro ao iniciar a chamada:', error);
    }
  }

  endCall() {
    this.peerConnection.close();
    this.localStream.getTracks().forEach((track) => track.stop());
    this.remoteStream.getTracks().forEach((track) => track.stop());
    this.localVideo.nativeElement.srcObject = null;
    this.remoteVideo.nativeElement.srcObject = null;
    this.callStarted = false;
  }

  shouldShowHeader(): boolean {
    // Lógica para determinar se o cabeçalho deve ser exibido neste componente
    // Por exemplo, se houver um estado específico que indique que o cabeçalho deve ser exibido
    return true; // Modifique a lógica conforme necessário
  }

  logout(): void {
    this.authService.logout(); // Chama o método de logout do serviço AuthService
  }
}
