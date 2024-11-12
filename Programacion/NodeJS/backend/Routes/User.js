import { Router } from "express";
import {getAllUser , getUserById, createUser, updatedUser, deleteUser} from '../controller/userController.js';

const routerUser = Router();

routerUser.get('/users', getAllUser);
routerUser.get('/users/:id', getUserById);
routerUser.post('/users', createUser);
routerUser.put('/users/:id', updatedUser);
routerUser.delete('/users/:id', deleteUser);

export  default routerUser;




