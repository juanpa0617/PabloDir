import { Router } from 'express';
import { getSales, createSale, getSale, updateSale, deleteSale } from '../controllers/Sale.Controller.js';

const saleRouter = Router();

saleRouter.get('/sales', getSales);
saleRouter.post('/sales', createSale);
saleRouter.get('/sales/:id', getSale);
saleRouter.put('/sales/:id', updateSale);
saleRouter.delete('/sales/:id', deleteSale);

export default saleRouter;
