import express from 'express';
import { Usuario } from '../models/usuario.model.js';
import { verifyToken } from '../middlewares/jwt.js';
import { requireRole } from '../middlewares/requiereRole.js';
import { verUsuario } from '../controllers/usuario.controller.js';

const usuarioRouter = express.Router();

usuarioRouter.get('/', verifyToken, requireRole('Administrador'), verUsuario);
export { usuarioRouter };
