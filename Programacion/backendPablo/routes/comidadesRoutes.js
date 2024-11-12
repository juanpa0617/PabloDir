import { Router } from "express";
import {getComodidades,getComodidadeById,postComodidades,putComodidades,deleteComodidades} from  '../controller/comodidadesController.js'


const routerComodidades  = Router()

routerComodidades.get('/Comodidades',getComodidades),
routerComodidades.get('/Comodidades/:id',getComodidadeById),
routerComodidades.post('/Comodidades',postComodidades),
routerComodidades.put('/Comodidades/:id',putComodidades),
routerComodidades.delete('/Comodidades/:id',deleteComodidades)

export  default routerComodidades




