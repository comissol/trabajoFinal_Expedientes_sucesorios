import DataTypes from 'sequelize';
import { sequelize } from '../config/database.js';
import bcrypt from 'bcryptjs';

const roles = ['Pasante', 'Secretaria', 'Administrador'];

export const Usuario = sequelize.define('Usuario', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: false
  },
  username: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
    set(value) {
        if (typeof value === 'string' && value.length > 0) {
            this.setDataValue('password', bcrypt.hashSync(value, 12));
        }
    }
  },
  rol: {
    type: DataTypes.ENUM(...roles),
    allowNull: false,
    defaultValue: 'Pasante'
  },
  activo: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
    defaultValue: true
  }
}, {
  tableName: 'usuarios',
  timestamps: true,
});