import Router from 'express'
import {postUser} from '../controllers/userController.js'


const  routerUser = Router()
routerUser.post('/', postUser)

export default  routerUser;







