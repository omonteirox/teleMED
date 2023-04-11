import { Injectable } from '@angular/core';
import { Observable, Observer } from 'rxjs';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private loggedIn = false;

  login(user: User): Observable<boolean> {
    return new Observable<boolean>((observer: Observer<boolean>) => {
      // Simulate a login request
      setTimeout(() => {
        if (user.username === 'admin' && user.password === 'password') {
          this.loggedIn = true;
          observer.next(true);
          observer.complete();
        } else {
          this.loggedIn = false;
          observer.next(false);
          observer.complete();
        }
      }, 2000);
    });
  }

  isLoggedIn(): boolean {
    return this.loggedIn;
  }

  logout(): void {
    this.loggedIn = false;
  }
}
