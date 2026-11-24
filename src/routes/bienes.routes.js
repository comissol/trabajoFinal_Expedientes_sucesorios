import { Router } from 'express';
import { verifyToken } from '../middlewares/jwt.js';
import { requireRole } from '../middlewares/requiereRole.js';
import { validate } from '../middlewares/validator.js';
import * as bienController from '../controllers/bien.controller.js';
import { eliminarBien, actualizarBien } from '../schemas/bien.validator.js';

export const bienRouter = Router();

bienRouter.patch('/:id', verifyToken, requireRole('Secretaria', 'Administrador'), validate(actualizarBien), bienController.updateBien); 
bienRouter.delete('/:id', verifyToken, requireRole('Administrador'), validate(eliminarBien), bienController.deleteBien);