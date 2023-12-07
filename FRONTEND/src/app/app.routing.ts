
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from "./app.component";
import { LoginComponent } from "./login/login.component";  // Asegúrate de importar LoginComponent
import { RegisterComponent } from "./register/register.component"; 


const appRoutes: Routes = [
    { path: "", component: AppComponent, pathMatch: "full" },
    { path: "login", component: LoginComponent },
    { path: "register", component: RegisterComponent },
  ];

export const routing = RouterModule.forRoot(appRoutes);