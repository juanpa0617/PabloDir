const Vehicle = require('../models/vehicle');
const { model } = require('mongoose')

//get trae todos los documentos de  Vehicles
const getVehicle = async(req , res) =>{
     const vehicles = await Vehicle.find()
     res.json(vehicles)

}

const postVehicle = async (req , res) =>{
    const body = req.body// obiene el body envia al post un formulario
    let msg = "Vehicle insered succesfull"
    try {
       
        const vehicle = new Vehicle(body)//crea un objeto y el body se le pasa todos los parametros
        await vehicle.save()//inserta objecto en la collecion


    } catch (error) {
        
        msg = error

    }

    res.json({msg:msg})
}

module.exports = {
    getVehicle,
    postVehicle
}