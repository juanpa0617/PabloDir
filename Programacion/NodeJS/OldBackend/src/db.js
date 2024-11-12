import mongoose from "mongoose";

export const connectDB = async () => {
    try {
        mongoose.connect('mongodb://localhost/merndb')
        console.log('Base de datos conectada');
    } catch (error) {
    console.log(error);
        
    }
}