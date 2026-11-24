import DataTypes from 'sequelize';
import { sequelize } from '../config/database.js';

export const Expediente = sequelize.define('Expediente', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    caratula: {
        type: DataTypes.STRING,
        allowNull: false
    },
    tipoProceso: {
        type: DataTypes.STRING,
        allowNull: false
    },
    numeroExpediente: {
        type: DataTypes.STRING,
        allowNull: false
    },
    juzgadoId: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    etapa: {
        type: DataTypes.STRING,
        allowNull: false
    },
    observaciones: {
        type: DataTypes.STRING,
        allowNull: true
    },
    fechaBaja: {
        type: DataTypes.DATE,
        allowNull: true
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
    tableName: 'expedientes',
    timestamps: true,
});