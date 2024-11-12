import {Schema, model} from 'mongoose'

const productsSchema = new Schema({
    name :{
        type:String,
        required:[true, 'The name is required.'],
    },
    refence:{
        type:String,
        required:[true, 'The reference is required.'],
    },
    units:{
        type:Number,
        required:[true, 'The units is required.'],
    },
    price:{
        type:Number,
        required:[true, 'The price is required.'],
    }
})

export default model('Product',productsSchema,'products')