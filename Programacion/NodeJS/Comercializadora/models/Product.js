import mongoose from "mongoose";

const productSchema = new mongoose.Schema({

    reference:{
        type:String,
        required:true,
        unique:true
    },
    name:{
        type:String,
        required:true
    },
    price:{
        type: Number,
    required: true,
    min: 0.01 
    },
    units: {
        type: Number,
        required: true,
        min: 0
    }
},{
    timestamps: true
})

export default mongoose.model( 'Product', productSchema)