import { DataTypes } from "sequelize";
import bcrypt from "bcryptjs";

import { sequelize } from "../database/database.js";
import { Role } from "./Role.js";

/**
 * Creamos la tabla Users con los atributos (columnas) de la tabla
 */
export const User = sequelize.define("Users", {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    unique: true,
  },
  name: {
    type: DataTypes.STRING(80),
    allowNull: true
  },
  lastName: {
    type: DataTypes.STRING(80),
    allowNull: true
  },
  document: {
    type: DataTypes.STRING(10),
    unique: true,
    allowNull: true,
  },
  date: {
    type: DataTypes.DATE,
    allowNull: true
  },
  email: {
    type: DataTypes.STRING(255),
    unique: true,
    allowNull: true,
  },
  password: {
    type: DataTypes.STRING(100),
    allowNull: true,
  },
  address:{
    type: DataTypes.STRING(100),
    allowNull:true,
  },
  gender:{
    type: DataTypes.CHAR,
    allowNull: true,
  },
  role: {
    type: DataTypes.ARRAY(DataTypes.STRING),
    defaultValue: [],
  }
},{
  timestamps: false
});

/**
 * hacemos la relacion N:N entre roles y usuarios
 * creamos una tabla intermedia UserRole
 */
User.belongsToMany(Role, {through: "UserRole"});
Role.belongsToMany(User, {through: "UserRole"});

/**
 * Con esta funcion hacemos el encriptado de la constraseña
 * @param {*} password el parametro requerido será la contraseña del usuario
 * @returns constraseña encriptada
 */
User.prototype.encryptPassword = async function (password) {
  const salt = await bcrypt.genSalt(10);
  return await bcrypt.hash(password, salt);
}

/**
 * Con esta funcion validamos la contraseña del usuario en el login
 * @param {*} password constraseña de la base de datos
 * @param {*} receivedPassword constraseña enviada por el usuario en el login
 */
User.prototype.comparePassword = async (password, receivedPassword) => {
  return await bcrypt.compare(password, receivedPassword);
}