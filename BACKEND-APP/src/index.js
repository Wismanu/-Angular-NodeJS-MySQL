const express = require('express');
const app = express();

//middlewares                                              hace referencia a algunas funciones que se ejecutan antes de que lleguen a las rutas
app.use(express.json());                                // Permite al servidor entender el formato JSON y asi poder trabajarlo en JS
app.use(express.urlencoded({extended:false}));          // Permite entender datos que vengan por medio de un formulario / El exctended false es para decirle que no acepta imagenes solo datos

//Routes/Rutas
app.use(require('./routes/index'));

app.listen(3000);
console.log("Server on port 3000");