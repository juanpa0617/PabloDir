import { Schema, model } from 'mongoose';


export const userSchema = new Schema({
    email: {
        type: String,
        unique: [true, 'Email already exists'],
        required: [true, 'Email is required'],
        minlength: [10, 'Email must have at least 10 characters'],
    },
    password: {
        type: String,
        required: [true, 'Password is required'],
        minlength: [5, 'Password must have at least 5 characters'],
    },
}, {
    timestamps: true,
    versionKey: false,
});

export default model('User', userSchema);


//El primer User se usa en el controlador  para crear un nuevo usuario
