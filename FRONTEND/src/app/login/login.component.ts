import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  email: string;
  password: string;

  constructor(private dataService: DataService) {
    this.email = '';
    this.password = '';
  }

  ngOnInit(): void {}

  login() {
    console.log(this.email);
    console.log(this.password);

    // Envia los datos al servidor Node.js usando el servicio
    this.dataService.login({ email: this.email, password: this.password }).subscribe(
      (response) => {
        // Maneja la respuesta del servidor
        console.log(response);
        alert("Loggeado");
      },
      (error) => {
        // Maneja los errores
        console.error(error);
      }
    );
  }
}
