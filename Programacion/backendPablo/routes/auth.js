import { Router } from 'express';
import { register, login, logout, profile, updateProfile, verifyToken } from '../controller/auth.js';

const routerAuth = Router();

routerAuth.post('/register', register);
routerAuth.post('/login', login);
routerAuth.post('/logout', verifyToken, logout); // Cambia de GET a POST
routerAuth.get('/profile', verifyToken, profile);
routerAuth.put('/update', verifyToken, updateProfile);

export default routerAuth;