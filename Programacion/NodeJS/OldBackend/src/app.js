import express from 'express';
import morgan from 'morgan';
import cookieParser from 'cookie-parser';
import authRoutes from './routes/auth.routes.js'; // Asegúrate de usar la importación por default
import taskRoutes from './routes/task.routes.js';

const app = express();

// Aquí puedes agregar middlewares, rutas, etc.
app.use(express.json()); // Asegúrate de agregar este middleware si estás enviando datos JSON
app.use(morgan('dev'));
app.use(cookieParser());

app.use( '/api',authRoutes); // Configura la ruta base para tus rutas de autenticación
app.use('/api',taskRoutes)

export default app;
