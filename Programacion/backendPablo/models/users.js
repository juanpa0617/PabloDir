import { Schema, model } from "mongoose";

export  const UserSchema = new Schema({
    nombre: { type: String, required: true },
    documento: { type: String, required: true, match: /^\d{6,15}$/ },
    email: { type: String, required: true, match: /^[^\s@]+@[^\s@]+\.[^\s@]+$/ },
    telefono: { type: String, required: true, match: /^\d{10,15}$/ },
    rol: { type: String, required: true, enum: ['empleado', 'admin'] },
    contraseña: { type: String, required: true },
  }, {
    timestamps: true,
    versionKey: false
  });

  export  const User = model('User', UserSchema);

