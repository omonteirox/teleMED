import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { LoginModel } from './login.model';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  apiUrl = 'https://example.com/api/login';

  constructor(private http: HttpClient) {}

  login(loginModel: LoginModel): Observable<any> {
    return this.http.post(this.apiUrl, loginModel);
  }
}
