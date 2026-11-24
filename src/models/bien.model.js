import DataTypes from 'sequelize';
import { sequelize } from '../config/database.js';

export const Bien = sequelize.define('Bien', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  expedienteId: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  tipo: {
    type: DataTypes.STRING,
    allowNull: false
  },
  descripcion: {
    type: DataTypes.STRING,
    allowNull: true
  },
  creadoPor: {
    type: DataTypes.STRING,
    allowNull: false
  },
  modificadoPor: {
    type: DataTypes.STRING,
    allowNull: true
  },
}, {
  tableName: 'bienes',
  timestamps: true,
});
