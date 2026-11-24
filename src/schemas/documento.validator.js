import { z } from 'zod';
import { texto, entero, creadoPor, modificadoPor, estadoDocumento, paramsId, paramsExpedienteId, tipoDocumento, rolPersona, tipoBien
} from '../middlewares/validator.js';

// Constante específica de Documento: acepta true o false (y si querés un default, agregá .default(...))
export const obligatorio = z.boolean({
  error: 'El campo obligatorio debe ser verdadero (true) o falso (false).',
});

// GET /expedientes/:expedienteId/documentos
export const listarDocumentos = {
  params: paramsExpedienteId,
  query: z.strictObject({
    estado: estadoDocumento.optional(),
    personaId: entero('personaId').optional(),
  }),
};

export const crearDocumento = {
  params: paramsExpedienteId,
  body: z.strictObject({
    tipoDocumento: tipoDocumento,
    descripcion: texto('descripcion', 255),
    rol: rolPersona.optional(),
    tipoBien: tipoBien.optional(),
    estado: estadoDocumento,
    obligatorio: obligatorio,
  }).refine((datos) => !(datos.personaId && datos.bienId), {
    error: 'Un documento se asocia a una persona o a un bien, no a ambos',
    path: ['bienId'],
  }),
};

// PATCH /documentos/:id  (cambiar el estado, el motivo o la descripción)
export const actualizarDocumento = {
  params: paramsId,
  body: z.strictObject({
    estado: estadoDocumento.optional(),
    motivo: texto('motivo', 255).optional(),
    descripcion: texto('descripcion', 255).optional(),
  })
    .refine((datos) => Object.keys(datos).some((campo) => campo !== 'modificadoPor'), {
      error: 'Enviá al menos uno de: estado, motivo, descripcion',
    })
    // Marcar un documento como "No aplica" exige explicar por qué
    .refine((datos) => datos.estado !== 'No aplica' || datos.motivo !== undefined, {
      error: 'motivo es obligatorio cuando el estado es No aplica',
      path: ['motivo'],
    }),
};

// DELETE /documentos/:id
export const eliminarDocumento = { params: paramsId };