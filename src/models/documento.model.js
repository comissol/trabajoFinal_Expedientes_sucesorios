import DataTypes from 'sequelize';
import { sequelize } from '../config/database.js';

export const Documento = sequelize.define('Documento', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  expedienteId: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  tipoDocumentoId: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  personaId: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  bienId: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  descripcion: {
    type: DataTypes.STRING,
    allowNull: true
  },
  estado: {
    type: DataTypes.STRING,
    allowNull: false
  },
  obligatorio: {
    type: DataTypes.BOOLEAN,
    allowNull: false
  },
  motivo: {
    type: DataTypes.STRING,
    allowNull: true
  },
  estadoActualizadoPor: {
    type: DataTypes.STRING,
    allowNull: true
  },
  estadoActualizadoEn: {
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
  },
}, {
  tableName: 'documentos',
  timestamps: true,
});

