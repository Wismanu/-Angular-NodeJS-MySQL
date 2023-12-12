import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";
import { Appointment } from "./Appointment.js";
import { Product } from "./Product.js";

export const Invoice = sequelize.define(
  "Invoices",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    total_amount: {
      type: DataTypes.DOUBLE,
      allowNull: false,
    },
    payment_status: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    timestamps: false,
  }
);

Invoice.belongsTo(Appointment, { foreignKey: "appointmentId", as: "cita" });
Appointment.hasOne(Invoice, { foreignKey: "appointmentId", as: "factura" });

Invoice.belongsToMany(Product, {
  through: "InvoiceProduct",
  foreignKey: "invoiceId",
  otherKey: "productId",
  as: "productos",
});
Product.belongsToMany(Invoice, {
  through: "InvoiceProduct",
  foreignKey: "productId",
  otherKey: "invoiceId",
  as: "facturas",
});
