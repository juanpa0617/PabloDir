import { Router } from "express";
import { getRooms, createRoom, updateRoom, deleteRoom, getRoom } from '../controller/habitacionesController.js';

const roomRoutes = Router();

// Rutas para habitaciones
roomRoutes.get('/habitaciones', getRooms);
roomRoutes.post('/habitaciones', createRoom); 
roomRoutes.put('/habitaciones/:id', updateRoom); 
roomRoutes.delete('/habitaciones/:id', deleteRoom);
roomRoutes.get('/habitaciones/:id', getRoom);

export default roomRoutes;
