import bcrypt from "bcryptjs";
import User from '../model/User.js'

// Función para generar una contraseña segura
function generarContraseña() {
  const longitud = 12; // Mayor longitud para mayor seguridad
  const caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()_+~`|}{[]:;?><,./-=";
  let contraseña = "";
  let tieneMinuscula = false;
  let tieneMayuscula = false;
  let tieneNumero = false;
  let tieneCaracterEspecial = false;

  while (contraseña.length < longitud) {
    const caracterAleatorio = caracteres.charAt(Math.floor(Math.random() * caracteres.length));
    contraseña += caracterAleatorio;

    if (/[a-z]/.test(caracterAleatorio)) tieneMinuscula = true;
    if (/[A-Z]/.test(caracterAleatorio)) tieneMayuscula = true;
    if (/[0-9]/.test(caracterAleatorio)) tieneNumero = true;
    if (/[^a-zA-Z0-9]/.test(caracterAleatorio)) tieneCaracterEspecial = true;
  }

  if (!tieneMinuscula || !tieneMayuscula || !tieneNumero || !tieneCaracterEspecial) {
    return generarContraseña();
  }

  return contraseña;
}

// Obtener todos los usuarios
export const getAllUser = async (req, res) => {
  try {
    const users = await User.find();
    res.status(200).json({ data: users });
  } catch (error) {
    console.error("Error al obtener usuarios:", error);
    res.status(500).json({ message: "Error al obtener usuarios" });
  }
};

// Obtener un usuario por su ID
export const getUserById = async (req, res) => {
  try {
    const id = req.params.id;
    const user = await User.findById(id);
    if (!user) {
      return res.status(404).json({ message: "Usuario no encontrado" });
    }
    res.status(200).json({ data: user });
  } catch (error) {
    console.error("Error al obtener usuario:", error);
    res.status(500).json({ message: "Error al obtener usuario" });
  }
};

// Crear un nuevo usuario
export const createUser = async (req, res) => {
  try {
    const nuevaContraseña = generarContraseña();
    const user = new User(req.body);

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(nuevaContraseña, salt);
    user.password = hashedPassword;

    await user.save();
    res.status(201).json({ data: user, message: "Usuario creado con éxito" });
  } catch (error) {
    console.error("Error al crear usuario:", error);
    res.status(500).json({ message: "Error al crear usuario" });
  }
};

// Actualizar un usuario
export const updatedUser = async (req, res) => {
  try {
    const id = req.params.id;
    const updates = req.body;

    if (updates.password) {
      const salt = await bcrypt.genSalt(10);
      updates.password = await bcrypt.hash(updates.password, salt);
    }

    const user = await User.findByIdAndUpdate(id, updates, { new: true });
    if (!user) {
      return res.status(404).json({ message: "Usuario no encontrado" });
    }

    res.status(200).json({ data: user, message: "Usuario actualizado con éxito" });
  } catch (error) {
    console.error("Error al actualizar usuario:", error);
    res.status(500).json({ message: "Error al actualizar usuario" });
  }
};

// Eliminar un usuario
export const deleteUser = async (req, res) => {
  try {
    const id = req.params.id;
    const user = await User.findByIdAndDelete(id);
    if (!user) {
      return res.status(404).json({ message: "Usuario no encontrado" });
    }
    res.status(200).json({ message: "Usuario eliminado con éxito" });
  } catch (error) {
    console.error("Error al eliminar usuario:", error);
    res.status(500).json({ message: "Error al eliminar usuario" });
  }
};