import mongoose from "mongoose";

const amenitiesSchema = new mongoose.Schema({
  articulos: {
    type: String,
    required: [true, 'All amenities must have articulos']
  },
  observacion: {
    type: String,
    minlength: [6, 'Observacion must be at least 6 characters'],
    required: [true, 'All amenities must have an observacion']
  },
  fechaIngreso: {
    type: Date,
    required: true,
  },
  estado: {
    type: String,
    enum: ['Disponible', 'En reparación', 'No disponible'],
    default: 'Disponible'
  },
});

export default mongoose.model("Amenities", amenitiesSchema);