const Owner = require('../models/owner');
const { model } = require('mongoose')

//get trae todos los documentos de  Vehicles
const getOwner = async(req , res) =>{
     const owners = await Owner.find()
     res.json(owners)

}

const postOwner = async (req , res) =>{
    const body = req.body// obiene el body envia al post un formulario
    let msg = "Owner insered succesfull"
    try {
       
        const owner = new Owner(body)//crea un objeto y el body se le pasa todos los parametros
        await owner.save()//inserta objecto en la collecion


    } catch (error) {
        
        msg = error

    }

    res.json({msg:msg})
}

module.exports = {
    getOwner,
    postOwner
}