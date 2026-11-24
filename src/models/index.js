import { Bien } from './bien.model.js';
import { Documento } from './documento.model.js';
import { Expediente } from './expediente.model.js';
import { Juzgado } from './juzgado.model.js';
import { Persona } from './persona.model.js';
import { PlantillaDocumentacion } from './plantillaDocumentacion.model.js';
import { TipoDocumento } from './tipoDocumento.model.js';
import { Usuario } from './usuario.model.js';

export {
    Bien,
    Documento,
    Expediente,
    Juzgado,
    Persona,
    PlantillaDocumentacion,
    TipoDocumento,
    Usuario
};

Expediente.hasMany(Documento, { foreignKey: 'expedienteId', as: "documentos" });
Documento.belongsTo(Expediente, { foreignKey: 'expedienteId', as: "expedientes" });
TipoDocumento.hasMany(Documento, { foreignKey: 'tipoDocumentoId', as: "documentos" });
Documento.belongsTo(TipoDocumento, { foreignKey: 'tipoDocumentoId', as: "tipos_documento" });

Expediente.hasMany(Bien, { foreignKey: 'expedienteId', as: "bienes" });
Bien.belongsTo(Expediente, { foreignKey: 'expedienteId', as: "expedientes" });

Juzgado.hasMany(Expediente, { foreignKey: 'juzgadoId', as: "expedientes" });
Expediente.belongsTo(Juzgado, { foreignKey: 'juzgadoId', as: "juzgados" });

Expediente.hasMany(Persona, { foreignKey: 'expedienteId', as: "personas" });
Persona.belongsTo(Expediente, { foreignKey: 'expedienteId', as: "expedientes" });

Persona.hasMany(Documento, { foreignKey: 'personaId', as: "documentos" });
Documento.belongsTo(Persona, { foreignKey: 'personaId', as: "personas" });


