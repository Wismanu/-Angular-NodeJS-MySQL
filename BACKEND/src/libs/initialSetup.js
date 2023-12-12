import { Role } from "../models/Role.js";
import { User } from "../models/User.js";

import jwt from "jsonwebtoken";
import config from "../config.js";
/**
 * Metodo encargado de crear los roles para el usuario
 * Se llama en app.js
 * @returns si ya existe data en los roles no retorna nada
 */
export const createRoles = async () => {
  try {
    const count = await Role.count();

    if (count > 0) return;

    const rolesToCreate = [
      { name: "cliente" },
      { name: "admin" },
      { name: "empleado" },
    ];

    await Role.bulkCreate(rolesToCreate);

    const createdRoles = await Role.findAll();
    console.log("Roles creados con éxito:");
    createdRoles.forEach((role) => {
      console.log(`ID: ${role.id}, Nombre: ${role.name}`);
    });
  } catch (error) {
    console.error(error);
  }
};

export const createFirstAdmin = async () => {
  try {
    const adminFound = await User.findOne({
      where: {
        role: ["admin"],
      },
    });
    const newUser = new User();

    if (adminFound) return;

    const adminRegistered = await User.create({
      name: "admin",
      lastName: "admin",
      document: "000000",
      email: "admin@admin.com",
      password: await newUser.encryptPassword("12345"),
      role: ["admin"]
    });

    const token = jwt.sign({id: adminRegistered.id}, config.SECRET, {
      expiresIn: 86400,
    });
    console.log(token);
  } catch (error) {
    console.error(error);
  }
};
