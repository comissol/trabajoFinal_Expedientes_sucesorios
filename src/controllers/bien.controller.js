import * as bienService from '../services/bien.service.js';

export async function getBienById(req, res, next) {
  try {
   const bienes = await bienService.getBienById(Number(req.params.expedienteId));
    if (bienes === null) {
      return res.status(404).json({ error: 'Expediente no encontrado' });
    }
    res.json(bienes);
  } catch (err) {
    next(err);
  }
}

export async function createBien(req, res, next) {
  try {
    const expedienteId = Number(req.params.expedienteId);
    const datos = { ...req.body, creadoPor: req.user.username };
    const bien = await bienService.createBien(expedienteId, datos);
    if (bien === null) {
      return res.status(404).json({ error: 'Expediente no encontrado' });
    }
    res.status(201).json(bien);
  } catch (err) {
    next(err);
  }
}

export async function updateBien(req, res, next) {
  try {
    const datos = { ...req.body, modificadoPor: req.user.username };
    const bien = await bienService.updateBien(req.params.id, datos);
    if (!bien) return res.status(404).json({ error: 'Bien no encontrado' });
    res.json(bien);
  } catch (err) {
    next(err);
  }
}

export async function deleteBien(req, res, next) {
  try {
    const bien = await bienService.deleteBien(req.params.id);
    if (!bien) return res.status(404).json({ error: 'Bien no encontrado' });
    res.json({ ...bien.toJSON(), message: 'Bien eliminado correctamente' });
  } catch (err) {
    next(err);
  }
}