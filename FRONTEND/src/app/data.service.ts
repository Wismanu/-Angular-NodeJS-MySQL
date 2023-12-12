import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
// @Injectable({
//   providedIn: 'root'
// })
// export class DataService {

//   constructor() { }
// }


@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'http://localhost:3000/api/auth/signin';

  constructor(private http: HttpClient) { }

  getData(): Observable<any> {
      return this.http.get(this.apiUrl);
  }

  login(data: any): Observable<any> {
    return this.http.post(`${this.apiUrl}`,data);
  }


}