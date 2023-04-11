import { Component } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { User } from '../models/user.model';
import { Observable, Observer } from 'rxjs';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  user: User = { username: '', password: '' };
  isLoading = false;
  isLoggedIn$: Observable<boolean>;

  constructor(private authService: AuthService) {
    this.isLoggedIn$ = new Observable<boolean>();
  }

  onSubmit(): void {
    this.isLoading = true;
    this.isLoggedIn$ = this.authService.login(this.user);
    this.isLoggedIn$.subscribe({
      next: (loggedIn) => {
        this.isLoading = false;
        if (loggedIn) {
          console.log('Logged in successfully!');
          // Redirect to dashboard
        } else {
          console.log('Invalid username or password');
        }
      },
      error: (err) => {
        this.isLoading = false;
        console.error('Failed to log in', err);
      }
    });
  }
}
