// src/middlewares/validateToken.js
import jwt from 'jsonwebtoken';
import { TOKEN_SECRET } from '../config.js';

export const authRequired = (req, res, next) => {
  const { token } = req.cookies;
  
  if (!token) {
    return res.status(401).json({ msg: 'No autorizado' });
  }

  jwt.verify(token, TOKEN_SECRET, (error, payload) => {
    if (error) {
      return res.status(401).json({ msg: 'Token inválido' });
    }
    
    // Asegúrate de pasar el payload del token al req.user
    req.user = payload;
    next();
  });
};
