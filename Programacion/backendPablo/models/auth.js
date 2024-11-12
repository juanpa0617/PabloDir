import { Schema, model } from 'mongoose';

const AuthSchema = new Schema({
  fullName: { type: String, required: true },
  identification: { type: String, required: true }, 
  birthDate: { type: Date, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
}, { timestamps: true }); 

export default model('Auth', AuthSchema);
