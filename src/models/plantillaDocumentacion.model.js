import DataTypes from 'sequelize';
import { sequelize } from '../config/database.js';

export const PlantillaDocumentacion = sequelize.define('PlantillaDocumentacion', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  tipoProceso: {    
    type: DataTypes.STRING,
    allowNull: false
  },
  tipoDocumentoId: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  aplicaA: {
    type: DataTypes.STRING,
    allowNull: false
  },
  etapa: {
    type: DataTypes.STRING,
    allowNull: false
  },
}, {
  tableName: 'plantilla_documentacion'
});
