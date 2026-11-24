import { z } from 'zod';
import { texto } from '../middlewares/validator.js';

// POST /auth/login
export const loginSchema = {
  body: z.strictObject({
    username: texto('username', 50),
    password: texto('password', 72),
  }),
};

// POST /auth/register
// Cualquiera puede registrarse, pero el rol NUNCA lo elige el cliente: siempre es Pasante.
// Como el schema es estricto, si alguien manda "rol" en el cuerpo recibe un 400 ("campo no permitido").
export const registerSchema = {
  body: z.strictObject({
    nombre: texto('nombre', 100),
    username: texto('username', 50)
      .min(3, { error: 'username debe tener al menos 3 caracteres' })
      .regex(/^[a-zA-Z0-9]+$/, { error: 'username admite solo letras y números' }),
    password: z.string({ error: (iss) => (iss.input === undefined ? 'falta el campo password' : 'password debe ser un texto') })
      .min(8, { error: 'password debe tener al menos 8 caracteres' })
      .max(72, { error: 'password admite hasta 72 caracteres' })
      .regex(/^[a-zA-Z0-9@*]+$/, { error: 'password admite solo letras, números, @ y *' })
  })
};