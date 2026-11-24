import { Router } from 'express';
import { verifyToken } from '../middlewares/jwt.js';
import * as documentoController from '../controllers/documento.controller.js';
import { requireRole } from '../middlewares/requiereRole.js';
import { actualizarDocumento, eliminarDocumento } from '../schemas/documento.validator.js';
import { validate} from '../middlewares/validator.js';

export const documentoRouter = Router();

documentoRouter.patch('/:id', verifyToken, requireRole('Secretaria', 'Administrador'), validate(actualizarDocumento), documentoController.updateDocumento);
documentoRouter.delete('/:id', verifyToken, requireRole('Administrador'), validate(eliminarDocumento), documentoController.deleteDocumento);
