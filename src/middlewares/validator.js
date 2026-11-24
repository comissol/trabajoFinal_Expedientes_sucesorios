import { z } from 'zod';

// 1. Piezas reutilizables
// Mensaje según el problema: si el dato no vino, "falta el campo"; si vino de otro tipo, "debe ser ...".
const mensaje = (campo, tipo) => (iss) =>
  iss.input === undefined ? `falta el campo ${campo}` : `${campo} debe ser ${tipo}`;
// Texto: sin espacios de más, no vacío y con un máximo (el mismo que tiene la columna en la base)
export const texto = (campo, max) =>
  z.string({ error: mensaje(campo, 'un texto') })
    .trim()
    .min(1, { error: `${campo} no puede estar vacío` })
    .max(max, { error: `${campo} admite hasta ${max} caracteres` });
// Número entero positivo. coerce convierte el texto "5" que llega en la URL o en la query en el número 5.
export const entero = (campo) =>
  z.coerce.number({ error: mensaje(campo, 'un número') })
    .int({ error: `${campo} debe ser un número entero` })
    .positive({ error: `${campo} debe ser mayor a 0` });
// Quién hizo el cambio (columnas creadoPor / modificadoPor, VARCHAR(50)).
// Provisorio: cuando conectes el login, estos datos salen del token y estas dos líneas se borran.
export const creadoPor = texto('creadoPor', 50);
export const modificadoPor = texto('modificadoPor', 50);
// Valores permitidos (los mismos ENUM que tiene la base)
const ETAPAS = [
  'Iniciado',
  'Declaratoria de Herederos',
  'Inscripción de DH/Adjudicación de bienes',
  'Finalizado',
];
const TIPOS_PROCESO = ['Ab Intestato', 'Testamentaria'];
const ROLES_PERSONA = ['Causante', 'Heredero', 'Cónyuge'];
const TIPOS_BIEN = ['Inmueble', 'Automotor', 'Otro'];
const ESTADOS_DOCUMENTO = ['Pendiente', 'Recibido', 'Validado', 'No aplica'];
const TIPOS_DOCUMENTO = ['DNI', 'Partida de Defunción', 'Partida de Matrimonio', 'Partida de Nacimiento', 'Otros', 'Poder', 'Título de propiedad inmueble', 'Título automotor'];

const lista = (campo, valores) => ({ error: `${campo} debe ser uno de: ${valores.join(', ')}` });

export const etapa = z.enum(ETAPAS, lista('etapa', ETAPAS));
export const tipoProceso = z.enum(TIPOS_PROCESO, lista('tipoProceso', TIPOS_PROCESO));
export const rolPersona = z.enum(ROLES_PERSONA, lista('rol', ROLES_PERSONA));
export const tipoBien = z.enum(TIPOS_BIEN, lista('tipo', TIPOS_BIEN));
export const estadoDocumento = z.enum(ESTADOS_DOCUMENTO, lista('estado', ESTADOS_DOCUMENTO));
export const tipoDocumento = z.enum(TIPOS_DOCUMENTO, lista('tipoDocumento', TIPOS_DOCUMENTO));
// Parámetros de la URL
export const paramsId = z.object({ id: entero('id') });
export const paramsExpedienteId = z.object({ expedienteId: entero('expedienteId') });

// 2. El middleware
export const validate = (schemas) => (req, res, next) => {
  const errores = [];
  // Valida una parte del pedido y, si hay problemas, los agrega a la lista
  const revisar = (schema, datos, origen) => {
    if (!schema) return undefined;
    const resultado = schema.safeParse(datos);
    if (resultado.success) return resultado.data;

    for (const problema of resultado.error.issues) {
      // "unrecognized_keys" = el cliente mandó un campo que no corresponde
      const campo = problema.code === 'unrecognized_keys'
        ? problema.keys.join(', ')
        : problema.path.join('.') || 'general'; // sin campo = regla que involucra a varios campos
      errores.push({
        origen, // body, params o query
        campo,
        mensaje: problema.code === 'unrecognized_keys' ? 'campo no permitido' : problema.message,
      });
    }
    return undefined;
  };

  revisar(schemas.params, req.params, 'params');
  revisar(schemas.query, req.query, 'query');
  const body = revisar(schemas.body, req.body ?? {}, 'body');

  if (errores.length > 0) {
    return res.status(400).json({ error: 'Datos inválidos', detalles: errores });
  }
  if (schemas.body) req.body = body;
  next();
};