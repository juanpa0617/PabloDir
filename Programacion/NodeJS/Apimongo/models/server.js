const express = require('express');
const { model } = require('mongoose');
const port = 3000;
require('dotenv').config()
const  dbConnection = require('../database/confing')
const {getVehicle,postVehicle} = require('../controllers/vehicleController')
const {getOwner, postOwner} = require ('../controllers/ownerController')

class Server {
    constructor(){
        this.app = express(); //is atributo , app se le esta asignado un metodo que es express
        this.listen();//Metodo listen
        this.dbConnection();//metodo dbConection(9)
        this.pathVehicle = '/api/Vehicle' // ruta publica de la api es un atributo
        this.route()//es un metodo
        this.pathOwner = '/api/Owner'

        
    }
       async dbConnection(){
         await dbConnection()
     }

     route(){
        this.app.use(express.json())//emplear el json al body
        this.app.get(this.pathVehicle, getVehicle)//llamar el vechiclecontrollador
        this.app.post(this.pathVehicle, postVehicle)
        // this.app.get(this.pathOwner , getOwner) 
        // this.app.post(this.pathOwner , postOwner) 
        

     }
    listen(){
        this.app.listen(process.env.PORT, () =>{
            console.log(`Server is running on port: ${process.env.PORT}`);
            
        });
    }
}

module.exports= Server//Exportar la clase server

