import { z } from 'zod';
import {   texto, entero, creadoPor, modificadoPor, etapa, tipoProceso, paramsId,
} from '../middlewares/validator.js';

// GET /api/expedientes (opcional: ?numeroExpediente=120)
// strictObject: un filtro que no existe (por ejemplo ?numero=120) da error en vez de ignorarse en silencio
export const listarExpedientes = {
  query: z.strictObject({
    numeroExpediente: entero('numeroExpediente').optional(),
  }),
};

// GET /expedientes/buscar/:busqueda
export const buscarExpedientes = {
  params: z.object({ busqueda: texto('busqueda', 100) }),
};

// POST /expedientes
export const crearExpediente = {
  body: z.strictObject({
    caratula: texto('caratula', 200),
    tipoProceso,
    numeroExpediente: entero('numeroExpediente'),
    juzgadoId: entero('juzgadoId'),
    observaciones: texto('observaciones', 5000).optional(),
    // Todo expediente nace en "Iniciado": si no viene, se completa solo (tu modelo no tiene valor por defecto)
    etapa: etapa.default('Iniciado'),
  }),
};

// PATCH /expedientes/:id
export const actualizarExpediente = {
  params: paramsId,
  body: z.strictObject({
    caratula: texto('caratula', 200).optional(),
    tipoProceso: tipoProceso.optional(),
    numeroExpediente: entero('numeroExpediente').optional(),
    juzgadoId: entero('juzgadoId').optional(),
    responsableId: entero('responsableId').optional(),
    observaciones: texto('observaciones', 5000).optional(),
    etapa: etapa.optional(),
  }).refine((datos) => Object.keys(datos).some((campo) => campo !== 'modificadoPor'), {
    error: 'Enviá al menos un dato para modificar',
  }),
};

// DELETE /expedientes/:id
export const eliminarExpediente = { params: paramsId };