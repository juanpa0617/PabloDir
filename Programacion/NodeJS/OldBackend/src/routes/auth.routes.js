import { Router } from 'express';
import { register, login, profile, logout } from '../controllers/auth.controller.js';
import { authRequired } from '../middlewares/validateToken.js';

const router = Router();

// Ruta para registrar un nuevo usuario
router.post('/register', register);

// Ruta para iniciar sesión
router.post('/login', login);

// Ruta para cerrar sesión
router.post('/logout', logout);

// Ruta protegida para obtener el perfil del usuario
router.get('/profile', authRequired, profile);

export default router;
