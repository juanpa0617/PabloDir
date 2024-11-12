const { Schema, model } = require('mongoose');

const OwnerSchema = new Schema({
    id: {
        type: Number,
        unique: true,
        required: [true, "The field plate is required"],
        maxlength: [20, 'Max 20 characters'],
        minlength: [6, 'Min 6 characters'],
    },
    name: {
        type: String,
        required: [true, "The field color is required"],
        minlength: [8, 'Min 8 characters'],
    },
    emai: {
        type: String,
        required: [true, "The field model is required"],
    },
    phone:{
        type: Number,
        required: [true, "The field model is required"],
    },
});

// Exporta el modelo correctamente
module.exports = model('Owner', OwnerSchema, 'owner');
