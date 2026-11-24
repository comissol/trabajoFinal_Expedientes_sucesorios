import rateLimit from 'express-rate-limit';
import { Router } from 'express';
import { login, register } from '../controllers/auth.controller.js';
import { validate } from '../middlewares/validator.js';
import { loginSchema, registerSchema } from '../schemas/auth.validator.js';
import { loginLimiter, registerLimiter } from '../middlewares/rateLimit.js';

export const authRouter = Router();

authRouter.post('/login', loginLimiter, validate(loginSchema), login);
authRouter.post('/register', registerLimiter, validate(registerSchema), register);
