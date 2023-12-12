import { Sequelize } from "sequelize";

export const sequelize = new Sequelize('test', 'postgres', '12345', {
    host: 'localhost',
    dialect: 'postgres'
});

