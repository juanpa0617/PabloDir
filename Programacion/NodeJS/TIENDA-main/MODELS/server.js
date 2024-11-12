import express, {json} from 'express'
import dbConnection from '../DATABASE/confi.js'
import 'dotenv/config'
import ProductRoutes from '../ROUTES/ProductRoutes.js'
import SaleRoutes from '../ROUTES/SaleRoutes.js'

class Server{
    constructor(){
        this.app = express()
        this.listen()
        this.dbConnection()
        this.pathProduct = '/api/Product'
        this.pathSale = '/api/Sale'
        this.route()
    }

    async dbConnection(){
        await dbConnection()
    }

    route(){
        this.app.use(json())  //esto hace que se reconozca en el postman que es json 
        this.app.use(this.pathProduct, ProductRoutes)
        this.app.use(this.pathSale, SaleRoutes)
    }

    listen(){
        this.app.listen(process.env.PORT, ()=>{
            console.log(`Server is running on port ${process.env.PORT}`)
        })
        
    }

}

export default Server
