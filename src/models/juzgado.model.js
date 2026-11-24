import DataTypes from 'sequelize';
import { sequelize } from '../config/database.js';

export const Juzgado = sequelize.define('Juzgado', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    numero: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    descripcion: {
        type: DataTypes.STRING,
        allowNull: false
    },
    activo: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: true
    }
    },
    {
        tableName: 'juzgados',
        timestamps: false,
});

