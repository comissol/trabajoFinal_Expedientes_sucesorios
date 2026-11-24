import express from 'express';
import { expedienteRouter } from './expedientes.routes.js';
import { personaRouter } from './personas.routes.js';
import { bienRouter } from './bienes.routes.js';
import { documentoRouter } from './documentos.routes.js';
import { authRouter } from './auth.routes.js';
import { usuarioRouter } from './usuario.routes.js';
import { apiLimiter } from '../middlewares/rateLimit.js';

const router = express.Router();

router.use('/expedientes', apiLimiter, expedienteRouter);
router.use('/personas', apiLimiter, personaRouter);
router.use('/bienes', apiLimiter, bienRouter);
router.use('/documentos', apiLimiter, documentoRouter);
router.use('/usuarios', apiLimiter, usuarioRouter);
router.use('/auth', authRouter);

export { router as Router };