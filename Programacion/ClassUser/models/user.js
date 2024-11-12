const {Schema, model} = require("mongoose")

const UserSchema = new Schema({
    document: {
        type: String,
        required: true,
        unique: true
    },
    name: {
        type: String,
        required: true
        
    },
    password: {
        type: String,
        required: true,
        minlength:8

    },
    telefono:{
        type: String,
        required: true,
        minlength: 8
    },
    rol:{
        type: String,
        required: true,
        minlength: 2
    }

})

module.exports = model('User', UserSchema, 'users')