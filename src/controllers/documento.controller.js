import * as documentoService from '../services/documento.service.js';

export async function getDocById(req, res, next) {
  try {
   const documentos = await documentoService.getDocById(Number(req.params.expedienteId));
    if (documentos === null) {
      return res.status(404).json({ error: 'Expediente no encontrado' });
    }
    res.json(documentos);
  } catch (err) {
    next(err);
  }
}

export async function createDocumento(req, res, next) {
  try {
    const expedienteId = Number(req.params.expedienteId);
    const datos = { ...req.body, creadoPor: req.user.username };
    const documento = await documentoService.createDocumento(expedienteId, datos);
    if (documento === null) {
      return res.status(404).json({ error: 'Expediente no encontrado' });
    }
    res.status(201).json(documento);
  } catch (err) {
    next(err);
  }
}

export async function updateDocumento(req, res, next) {
    try {
    const datos = { ...req.body, modificadoPor: req.user.username };
    const documento = await documentoService.updateDocumento(req.params.id, datos);
    if (!documento) return res.status(404).json({ error: 'Documento no encontrado' });
    res.json(documento);
  } catch (err) {
    next(err);
  }
}

export async function deleteDocumento(req, res, next) {
  try {
    const documento = await documentoService.deleteDocumento(req.params.id);
    if (!documento) return res.status(404).json({ error: 'Documento no encontrado' });
    res.json({ ...documento.toJSON(), message: 'Documento eliminado correctamente' });
  } catch (err) {
    next(err);
  }
}
