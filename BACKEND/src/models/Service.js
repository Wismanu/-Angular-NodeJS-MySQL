import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";


export const Service = sequelize.define(
    "Services", 
    {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        name: {
            type: DataTypes.STRING(100),
            allowNull: false,
        },
        description: {
            type: DataTypes.TEXT
        },
        price: {
            type: DataTypes.DOUBLE,
            allowNull: false,
        },
    }, {
        timestamps: false,
    }
)
