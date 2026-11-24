import { z } from 'zod';
import { texto, creadoPor, modificadoPor, tipoBien, paramsId, paramsExpedienteId } from '../middlewares/validator.js';

// GET /expedientes/:expedienteId/bienes
export const listarBienes = { params: paramsExpedienteId };

// POST /expedientes/:expedienteId/bienes
export const crearBien = {
  params: paramsExpedienteId,
  body: z.strictObject({
    tipo: tipoBien,
    descripcion: texto('descripcion', 255)
  }),
};
// PATCH /bienes/:id  (solo la descripción: el tipo y el expediente no se cambian)
export const actualizarBien = {
  params: paramsId,
  body: z.strictObject({
    descripcion: texto('descripcion', 255),
  }),
};
// DELETE /bienes/:id
export const eliminarBien = { params: paramsId };