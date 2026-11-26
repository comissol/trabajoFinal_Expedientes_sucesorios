import { Persona } from '../models/persona.model.js';
import { Expediente } from '../models/expediente.model.js';
import { Juzgado } from '../models/juzgado.model.js';

export async function getPersonaById(expedienteId) {
  const expediente = await Expediente.findOne({ where: { id: expedienteId, fechaBaja: null },
  attributes: ['caratula','numeroExpediente'], include: [{model: Juzgado, attributes: ['descripcion'], as: 'juzgados'}]
  });
  if (!expediente) return null;

  const personas = await Persona.findAll({
    where: { expedienteId },
    attributes: ['id', 'dni', 'nombreCompleto', 'rol']
  });
  return {
    expediente,
    personas
  };
}


export async function createPersona(expedienteId, data) {
  const expediente = await Expediente.findByPk(expedienteId);
  if (!expediente) {
    return null;
  }
  return Persona.create({ ...data, expedienteId });
}

export async function updatePersona(id, data) {
  const persona = await Persona.findByPk(id);
  if (!persona) return null;
  return persona.update(data);
}

export async function deletePersona(id) {
  const persona = await Persona.findByPk(id);
  if (!persona) return null;
  await persona.destroy();
  return persona;
}
