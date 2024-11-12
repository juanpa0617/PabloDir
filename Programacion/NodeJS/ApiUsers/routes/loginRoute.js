import Router from 'express'
import { login} from '../controllers/userController.js'


const  routerLogin = Router()
routerLogin.post('/',login)

export default  routerLogin;







