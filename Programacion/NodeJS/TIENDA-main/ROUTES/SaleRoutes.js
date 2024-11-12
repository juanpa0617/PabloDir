import { Router } from "express";
const SaleRoutes = Router()

import { getSale, postSales, putSales, deleteSales } from "../CONTROLLERS/SaleController.js";

SaleRoutes.get('/', getSale)
SaleRoutes.post('/', postSales)
SaleRoutes.put('/:id', putSales)
SaleRoutes.delete('/:id', deleteSales)

export default SaleRoutes