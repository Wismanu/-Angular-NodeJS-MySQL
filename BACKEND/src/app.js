import express from "express";
import morgan from "morgan";
import cors from "cors";
import { createRoles, createFirstAdmin } from "./libs/initialSetup.js";

import productsRoutes from "./routes/products.routes.js";
import authRoutes from "./routes/auth.routes.js";
import usersRoutes from "./routes/user.routes.js";
import serviceRoutes from "./routes/service.routes.js";
import appointmentRoutes from "./routes/appointment.routes.js";
import invoceRoutes from "./routes/invoice.routes.js";


const app = express();
createRoles();
createFirstAdmin();

const corsOptions = {
  origin: "*",
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  allowedHeaders: "Content-Type,Authorization",
  optionsSuccessStatus: 204,
  credentials: true,
};
app.use(cors());
app.use(morgan("dev"));

app.use(express.json());

//usamos esto para cerrar la sesion
app.use((req, res, next) => {
  const invalidTokens = req.app.get("invalidTokens") || [];
  const token = req.headers["x-access-token"];

  if (invalidTokens.includes(token)){
    return res.status(401).json({ message: "Token revoked or invalid" });
  }

  next();
})

app.use("/api/products", productsRoutes);
app.use("/api/auth", authRoutes);
app.use("/api/users", usersRoutes);
app.use("/api/service", serviceRoutes);
app.use("/api/appointment", appointmentRoutes);
app.use("/api/invoice", invoceRoutes);

export default app;
