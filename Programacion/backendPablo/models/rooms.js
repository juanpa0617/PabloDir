import { Schema, model } from "mongoose";
import mongoose from "mongoose";

export const RoomSchema  = new Schema({
    nombre: { type: String, required: true },
    capacidad: { type: Number, required: true },
    estado: { type: String, enum: ['Disponible', 'En mantenimiento', 'Reservada'], default: 'Disponible' },
    descripcion: { type: String, required: true },
    imagen: { type: String }, 
    comodidades: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Comodidades' }]
});

export const Room = model ('Room', RoomSchema);

