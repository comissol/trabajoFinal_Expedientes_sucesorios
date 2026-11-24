import * as personaService from '../services/persona.service.js';

export async function getPersonaById(req, res, next) {
  try {
   const personas = await personaService.getPersonaById(Number(req.params.expedienteId));
    if (personas === null) {
      return res.status(404).json({ error: 'Expediente no encontrado' });
    }
    res.json(personas);
  } catch (err) {
    next(err);
  }
}

export async function createPersona(req, res, next) {
  try {
    const expedienteId = Number(req.params.expedienteId);
    const datos = { ...req.body, creadoPor: req.user.username };
    const persona = await personaService.createPersona(expedienteId, datos);
    if (persona === null) {
      return res.status(404).json({ error: 'Expediente no encontrado' });
    }
    res.status(201).json(persona);
  } catch (err) {
    next(err);
  }
}

export async function updatePersona(req, res, next) {
  try {
    const datos = { ...req.body, modificadoPor: req.user.username };
    const persona = await personaService.updatePersona(req.params.id, datos);
    if (!persona) return res.status(404).json({ error: 'Persona no encontrada' });
    res.json(persona);
  } catch (err) {
    next(err);
  }
}

export async function deletePersona(req, res, next) {
  try {
    const persona = await personaService.deletePersona(req.params.id);
    if (!persona) return res.status(404).json({ error: 'Persona no encontrada' });
    res.json({ ...persona.toJSON(), message: 'Persona eliminada correctamente' });
  } catch (err) {
    next(err);
  }
}