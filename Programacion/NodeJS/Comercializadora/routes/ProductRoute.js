import { Router } from 'express';
import { getProducts, createProduct, getProduct, updateProduct, deleteProduct } from '../controllers/ProductoController.js';

const productRouter = Router();

productRouter.get('/products', getProducts);
productRouter.post('/products', createProduct);
productRouter.get('/products/:id', getProduct);
productRouter.put('/products/:id', updateProduct);
productRouter.delete('/products/:id', deleteProduct);

export default productRouter;
