import DataTypes from 'sequelize';
import { sequelize } from '../config/database.js';

export const Persona = sequelize.define('Persona', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    expedienteId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    nombreCompleto: {
        type: DataTypes.STRING,
        allowNull: false
    },
    dni: {
        type: DataTypes.STRING,
        allowNull: true
    },
    rol: {
        type: DataTypes.STRING,
        allowNull: false
    },
    creadoPor: {
        type: DataTypes.STRING,
        allowNull: false
    },
    modificadoPor: {
        type: DataTypes.STRING,
        allowNull: true
    }
}, {
    tableName: 'personas',
    timestamps: true,
});