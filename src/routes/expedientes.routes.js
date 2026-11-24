import { Router } from 'express';
import * as expedienteController from '../controllers/expediente.controller.js';
import * as personaController from '../controllers/persona.controller.js';
import * as bienController from '../controllers/bien.controller.js';
import * as documentoController from '../controllers/documento.controller.js';
import { requireRole } from '../middlewares/requiereRole.js';
import { verifyToken } from '../middlewares/jwt.js';
import { validate } from '../middlewares/validator.js';
import { listarBienes, crearBien } from '../schemas/bien.validator.js';
import { listarPersonas, crearPersona } from '../schemas/persona.validator.js';
import { listarDocumentos, crearDocumento } from '../schemas/documento.validator.js';
import { listarExpedientes, buscarExpedientes, crearExpediente, actualizarExpediente, eliminarExpediente } from '../schemas/expediente.validator.js';

export const expedienteRouter = Router();

expedienteRouter.get('/buscar/:busqueda', verifyToken, requireRole('Pasante', 'Secretaria', 'Administrador'), validate(buscarExpedientes), expedienteController.buscarExpedientes);
expedienteRouter.get('/', verifyToken, requireRole('Pasante', 'Secretaria', 'Administrador'), validate(listarExpedientes), expedienteController.getAllExpedientes); // GET /api/expedientes (opcional: ?numeroExpediente=120)
expedienteRouter.post('/', verifyToken, requireRole('Secretaria', 'Administrador'), validate(crearExpediente), expedienteController.createExpediente);
expedienteRouter.patch('/:id', verifyToken, requireRole('Secretaria', 'Administrador'), validate(actualizarExpediente), expedienteController.updateExpediente);
expedienteRouter.delete('/:id', verifyToken, requireRole('Administrador'), validate(eliminarExpediente), expedienteController.deleteExpediente);

expedienteRouter.get('/:expedienteId/personas', verifyToken, requireRole('Pasante', 'Secretaria', 'Administrador'), validate(listarPersonas), personaController.getPersonaById);
expedienteRouter.post('/:expedienteId/personas', verifyToken, requireRole('Secretaria', 'Administrador'), validate(crearPersona), personaController.createPersona);

expedienteRouter.get('/:expedienteId/bienes', verifyToken, requireRole('Pasante', 'Secretaria', 'Administrador'), validate(listarBienes), bienController.getBienById);
expedienteRouter.post('/:expedienteId/bienes', verifyToken, requireRole('Secretaria', 'Administrador'), validate(crearBien), bienController.createBien);

expedienteRouter.get('/:expedienteId/documentos', verifyToken, requireRole('Pasante', 'Secretaria', 'Administrador'), validate(listarDocumentos), documentoController.getDocById);
expedienteRouter.post('/:expedienteId/documentos', verifyToken, requireRole('Secretaria', 'Administrador'), validate(crearDocumento), documentoController.createDocumento);
