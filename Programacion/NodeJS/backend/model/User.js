
import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
  id: { type: String, required: true },
  nombre: { type: String, required: true },
  documento: { type: String, required: true,  unique: true },
  email: { type: String, required: true,  unique: true },
  telefono: { type: String, required: true },
  rol: { type: String, required: true },
  contraseña: { type: String, required: true },
});

export default mongoose.model("User", userSchema);
