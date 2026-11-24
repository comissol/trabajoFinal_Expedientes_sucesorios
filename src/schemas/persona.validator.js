import { z } from 'zod';
import { texto, creadoPor, modificadoPor, rolPersona, paramsId, paramsExpedienteId } from '../middlewares/validator.js';

// GET /expedientes/:expedienteId/personas
export const listarPersonas = { params: paramsExpedienteId };

// POST /expedientes/:expedienteId/personas
export const crearPersona = {
  params: paramsExpedienteId,
  body: z.strictObject({
    nombreCompleto: texto('nombreCompleto', 150),
    dni: texto('dni', 15).optional(),
    rol: rolPersona
  }),
};

// PATCH /personas/:id  (nombre y/o DNI; el rol no se modifica: si se equivocaron, se da de baja y se carga de nuevo)
export const actualizarPersona = {
  params: paramsId,
  body: z.strictObject({
    nombreCompleto: texto('nombreCompleto', 150).optional(),
    dni: texto('dni', 15).optional(),
  }).refine((datos) => Object.keys(datos).some((campo) => campo !== 'modificadoPor'), {
    error: 'Enviá nombreCompleto, dni o ambos',
  }),
};

// DELETE /personas/:id
export const eliminarPersona = { params: paramsId };