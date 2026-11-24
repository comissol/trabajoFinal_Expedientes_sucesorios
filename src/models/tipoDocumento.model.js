import DataTypes from 'sequelize';
import { sequelize } from '../config/database.js';

export const TipoDocumento = sequelize.define('TipoDocumento', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nombre: {
        type: DataTypes.STRING,
        allowNull: false
    },
}, {
    tableName: 'tipos_documento',
    timestamps: false,
});