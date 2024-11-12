const { Schema, model } = require('mongoose');

const VehicleSchema = new Schema({
    plate: {
        type: String,
        unique: true,
        required: [true, "The field plate is required"],
        maxlength: [6, 'Max 6 characters'],
        minlength: [5, 'Min 5 characters'],
    },
    color: {
        type: String,
        required: [true, "The field color is required"],
        minlength: [3, 'Min 3 characters'],
    },
    model: {
        type: Number,
        required: [true, "The field model is required"],
    },
});

// Exporta el modelo correctamente
module.exports = model('Vehicle', VehicleSchema, 'vehicle');
