import express, { json } from "express";
import "dotenv/config.js";
import dbConnection from "../database/config.js"; 
import  saleRouter   from "../routes/SaleRoute.js";
import productRouter from "../routes/ProductRoute.js";
export default class Server {
  constructor() {
    this.app = express();
    this.listen();
    this.dbConnection();
    this.app.use(json());
  }

  async dbConnection() {
    await dbConnection();
  }
  routes(){
    this.app.use('/api' ,saleRouter)
    this.app.use('/api', productRouter)
  }
  

  listen() {
    this.app.listen(process.env.PORT, () => {
        console.log(`Server is running on port ${process.env.PORT}`);
    });
}
}
