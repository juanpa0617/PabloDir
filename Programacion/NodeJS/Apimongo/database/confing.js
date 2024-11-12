const mongoose =  require('mongoose')

const dbConnection = async() =>{
   
    try {
        await mongoose.connect(process.env.MONGO_CNN)
        console.log('Connected to mongo DB');
        
    } catch (error) {
        console.log(error);
        
    }

}

module.exports = dbConnection //exporta la conexion