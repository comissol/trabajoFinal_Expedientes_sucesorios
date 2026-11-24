import { Router } from 'express';
import * as personaController from '../controllers/persona.controller.js';
import { requireRole } from '../middlewares/requiereRole.js';
import { verifyToken } from '../middlewares/jwt.js';
import {actualizarPersona, eliminarPersona } from '../schemas/persona.validator.js';
import { validate } from '../middlewares/validator.js';

export const personaRouter = Router();

personaRouter.patch('/:id', verifyToken, requireRole('Secretaria', 'Administrador'), validate(actualizarPersona), personaController.updatePersona);
personaRouter.delete('/:id', verifyToken, requireRole('Administrador'), validate(eliminarPersona), personaController.deletePersona);