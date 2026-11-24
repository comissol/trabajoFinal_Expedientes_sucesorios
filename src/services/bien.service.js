import  { Bien, Expediente, Juzgado } from '../models/index.js';

export async function getBienById(expedienteId) {
  const expediente = await Expediente.findOne({ where: { id: expedienteId, fechaBaja: null },
  attributes: ['caratula','numeroExpediente'], include: [{model: Juzgado, attributes: ['descripcion'], as: 'juzgados'}]
  });
  if (!expediente) return null;

  const bienes = await Bien.findAll({
    where: { expedienteId },
    attributes: ['id', 'tipo', 'descripcion', 'expedienteId']
  });
  return {
    expediente,
    bienes
  };
}

export async function createBien(expedienteId, data) {
  const expediente = await Expediente.findByPk(expedienteId);
  if (!expediente) {
    return null;
  }
  return Bien.create({ ...data, expedienteId });
}

export async function updateBien(id, data) {
   if (!data.modificadoPor) {
    const error = new Error('modificadoPor es obligatorio');
    error.status = 400;
    throw error;
  }
  const bien = await Bien.findByPk(id);
  if (!bien) return null;
  return bien.update(data);
}

export async function deleteBien(id) {
  const bien = await Bien.findByPk(id);
  if (!bien) return null;
  await bien.destroy();
  return bien;
}
