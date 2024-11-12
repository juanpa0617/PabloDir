import mongoose from "mongoose";

// Definición del esquema para las tareas
const taskSchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: true
    },
    description: {
      type: String,
      required: true
    },
    date: {
      type: Date,
      default: Date.now
    },
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    }

  },
  {
    timestamps: true
  }
);

// Exportación del modelo basado en el esquema
export default mongoose.model("Task", taskSchema);
