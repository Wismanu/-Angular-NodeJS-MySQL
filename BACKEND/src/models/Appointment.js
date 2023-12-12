import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";
import { User } from "./User.js";
import { Service } from "./Service.js";

export const Appointment = sequelize.define(
  "Appointment",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    date_hour: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    client_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: User,
        key: "id",
      },
    },
    beautician_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: User,
        key: "id",
      },
    },
    service_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: Service,
        key: "id",
      },
    },
    state: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    timestamps: false,
  }
);

User.hasMany(Appointment, {
  foreignKey: "client_id",
  as: "client_appointments",
});
Appointment.belongsTo(User, { foreignKey: "client_id", as: "client" });

User.hasMany(Appointment, {
  foreignKey: "beautician_id",
  as: "beautican_appointments",
});
Appointment.belongsTo(User, { foreignKey: "beautician_id", as: "beautician" });

Service.hasMany(Appointment, {
  foreignKey: "service_id",
  as: "service_appointment",
});
Appointment.belongsTo(Service, { foreignKey: "service_id", as: "service" });
