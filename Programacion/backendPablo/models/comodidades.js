import { Schema, model } from "mongoose";

// Definición del esquema
export const comodidadesSchema = new Schema({
  articulos: {
    type: String,
    required: true,
    trim: true, 
  },
  observacion: {
    type: String,
    required: true,
    trim: true, 
  },
  fechaIngreso: {
    type: Date,
    required: true,
    validate: {
      validator: (date) => !isNaN(date.getTime()),
      message: "Fecha inválida",
    },
  },
  estado: {
    type: String,
    required: true,
    default: 'Disponible',
    enum: ['Disponible', 'En reparación', 'No disponible'], 
  },
}, {
  timestamps: true, 
  versionKey: false, 
});

// Creación del modelo
export default model('Comodidades', comodidadesSchema);