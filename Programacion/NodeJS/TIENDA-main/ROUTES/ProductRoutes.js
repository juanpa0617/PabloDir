import { Router } from "express";
const ProductRoutes = Router()

import { getProduct, postProduct, putProduct, deleteProduct } from "../CONTROLLERS/ProductController.js";

ProductRoutes.get('/', getProduct)
ProductRoutes.post('/', postProduct)
ProductRoutes.put('/', putProduct)
ProductRoutes.delete('/:id', deleteProduct)

export default ProductRoutes