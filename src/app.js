import express from 'express';
import helmet from 'helmet';
import swaggerUi from 'swagger-ui-express';
import spec from './docs/openApi.js'; 
import { errorHandler, notFound } from './middlewares/errorHandler.js';
import  { Router } from './routes/index.js';
export const app = express();

app.use(helmet()); // seguridad HTTP/headers
app.use(express.json());
app.use('/api', Router);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(spec));
app.use(notFound);
app.use(errorHandler);