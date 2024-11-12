const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({

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

});

module.exports = mongoose.model('User', userSchema, 'users');
