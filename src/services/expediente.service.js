import { Expediente, Documento, Bien, Juzgado, Persona, TipoDocumento } from '../models/index.js';
import { Op } from 'sequelize';

export async function buscarExpedientes(texto) {
  const palabras = texto.trim().split(/\s+/);
  const where = {
    fechaBaja: null,
    [Op.and]: palabras.map((palabra) => ({
      [Op.or]: [
        { caratula: { [Op.like]: `%${palabra}%` } },
        { numeroExpediente: { [Op.like]: `%${palabra}%` } },
      ],
    })),
  };

  return Expediente.findAll({ where, order: [['caratula', 'ASC']] });
}

export async function getAllExpedientes({ numeroExpediente } = {}) {
  const where = { fechaBaja: null };
  if (numeroExpediente) where.numeroExpediente = numeroExpediente;

  return await Expediente.findAll({
    where,
    attributes: [
      'id',
      'numeroExpediente',
      'caratula',
      'etapa',
      'observaciones'
    ],
    include: [
      { model: Juzgado, attributes: ['descripcion'], as: 'juzgados' },
      { model: Persona, attributes: ['dni', 'nombreCompleto', 'rol'], as: 'personas' },
      { model: Documento, attributes: ['estado'],
              include: [{ model: TipoDocumento, attributes: ['nombre'], as: 'tipos_documento' }], as: 'documentos' },
      { model: Bien, attributes: ['tipo', 'descripcion'], as: 'bienes' }
    ],
    order: [['caratula', 'ASC']],
  });
}

export async function createExpediente(data) {
    return Expediente.create({ ...data, modificadoPor: data.creadoPor });

}

export async function updateExpediente(id, data) {
  const expediente = await Expediente.findByPk(id);
  if (!expediente) return null;
  return await expediente.update(data);
}

export async function deleteExpediente(id) {
  const expediente = await Expediente.findByPk(id);
  if (!expediente) return null;
  await expediente.destroy();
  return expediente;
}
