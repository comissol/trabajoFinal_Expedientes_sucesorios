import * as expedienteService from '../services/expediente.service.js';

export async function buscarExpedientes(req, res, next) {
  try {
    const expedientes = await expedienteService.buscarExpedientes(req.params.busqueda);
    if (expedientes.length === 0) {
      return res.status(404).json({ error: `No se encontraron expedientes que contengan "${req.params.busqueda}"` });
    }
    res.json(expedientes);
  } catch (err) {
    next(err);
  }
}

export async function getAllExpedientes(req, res, next) {
  try {
    const numeroExpediente = req.query.numeroExpediente
      ? Number(req.query.numeroExpediente)
      : undefined;
    if (Number.isNaN(numeroExpediente)) {
      return res.status(400).json({ error: 'numeroExpediente debe ser un número' });
    }

    const expedientes = await expedienteService.getAllExpedientes({ numeroExpediente });
    if (numeroExpediente && expedientes.length === 0) {
      return res.status(404).json({
        error: `No existe ningún expediente con el número ${numeroExpediente}`
      });
    }
    return res.json(expedientes);
  } catch (err) {
    next(err);
  }
}

export async function createExpediente(req, res, next) {
  try {
    const datos = { ...req.body, creadoPor: req.user.username };
    const expediente = await expedienteService.createExpediente(datos);
    res.status(201).json(expediente);
  } catch (err) {
    next(err);
  }
}

export async function updateExpediente(req, res, next) {
  try {
    const datos = { ...req.body, modificadoPor: req.user.username };
    const expediente = await expedienteService.updateExpediente(req.params.id, datos);
    if (!expediente) return res.status(404).json({ error: 'Expediente no encontrado' });
    res.json(expediente);
  } catch (err) {
    next(err);
  }
}

export async function deleteExpediente(req, res, next) {
  try {
    const expediente = await expedienteService.deleteExpediente(req.params.id);
    if (!expediente) return res.status(404).json({ error: 'Expediente no encontrado' });
    res.json({ ...expediente.toJSON(), message: 'Expediente eliminado correctamente' });
  } catch (err) {
    next(err);
  }
}