import { Router } from "express";
import {postUser,putUser,getUserById,getAllUsers,deleteUser} from '../controller/userController.js'

const routerUser  = Router()
routerUser.post('/user', postUser)
routerUser.put('/user/:id', putUser)
routerUser.get('/user/:id', getUserById)
routerUser.delete ('/user/:id', deleteUser)
routerUser.get('/user', getAllUsers)

export default  routerUser;



