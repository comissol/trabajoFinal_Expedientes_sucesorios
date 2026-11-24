import { Documento, Expediente, Juzgado, Persona, TipoDocumento } from '../models/index.js';

export async function getDocById(expedienteId) {
  const expediente = await Expediente.findOne({
    where: { id: expedienteId, fechaBaja: null },
    attributes: ['caratula', 'numeroExpediente'],
    include: [
      {
        model: Juzgado,
        as: 'juzgados',
        attributes: ['descripcion']
      }
    ]
  });
  if (!expediente) return null;
  const documentos = await Documento.findAll({
    where: { expedienteId },
    attributes: [
      'descripcion',
      'estado',
      'motivo'
    ],
    include: [
      {
        model: Persona,
        as: 'personas',
        attributes: ['nombreCompleto', 'dni']
      }
      ,
      {
        model: TipoDocumento,
        as: 'tipos_documento',
        attributes: ['nombre']
      }
    ] 
  });
  return {
    expediente,
    documentos,
  };
}

export async function createDocumento(expedienteId, data) {
const expediente = await Expediente.findByPk(expedienteId);
  if (!expediente) {
    return null;
  }
  // 1. Buscamos el tipo de documento por su nombre (ajustá 'nombre' si la columna se llama distinto)
const tipoDoc = await TipoDocumento.findOne({
    where: { nombre: data.tipoDocumento },
  });
  if (!tipoDoc) {
    const error = new Error(`No existe el tipo de documento "${data.tipoDocumento}".`);
    error.status = 400;
    throw error;
  }
  // 2. Separamos 'tipoDocumento' (texto del request) para mandar 'tipoDocumentoId'
  const { tipoDocumento, ...datosDocumento } = data;

  return Documento.create({
    ...datosDocumento,
    expedienteId,
    tipoDocumentoId: tipoDoc.id,
  });
}

export async function updateDocumento(id, data) {
  const documento = await Documento.findByPk(id);
  if (!documento) return null;
  return documento.update(data);
}

export async function deleteDocumento(id) {
  const documento = await Documento.findByPk(id);
  if (!documento) return null;
  await documento.destroy();
  return documento;
}
