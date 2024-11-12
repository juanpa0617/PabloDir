import express from "express";
import dbConnection from "../config/database.js";
import cors  from "cors";
import roomRoutes from "../routes/habitacionesRoutes.js";
import "dotenv/config";
import morgan from "morgan";
import routerComodidades from "../routes/comidadesRoutes.js";
import routerUser  from "../routes/userRoutes.js";
import routerAuth from "../routes/auth.js";
import cookieParser from "cookie-parser";


export default class Server {
  constructor() {
    this.app = express();
    this.app.use(express.json());
    this.app.use(cors());
    this.dbconnection();
    this.app.use(morgan("dev"));
    this.app.use(cookieParser()); // Configura cookie-parser aquí
    this.routes();
    this.listen();
  }
  async dbconnection() {
    try {
      await dbConnection();
      console.log("Database connected");
    } catch (error) {
      console.log("Error connecting to database");
      console.log(error);
    }
  }

 
  routes(){
    this.app.use("/api", routerComodidades);
    this.app.use("/api", routerUser);
    this.app.use ("/api", roomRoutes);
    this.app.use("/api", routerAuth);


  }

  listen() {
    this.app.listen(process.env.PORT, () => {
      console.log(`Server is running on port ${process.env.PORT}`);
    });
  }
}
