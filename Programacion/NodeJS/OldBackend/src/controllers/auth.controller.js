
import User from "../models/user.model.js";
import bcrypt from "bcryptjs";
import { createAccessToken } from "../libs/jwt.js";

export const register = async (req, res) => {
  const { email, password, username } = req.body;

  try {
    const passwordHash = await bcrypt.hash(password, 10);
    const newUser = new User({
      email, 
      password: passwordHash, 
      username 
    });

    const userSaved = await newUser.save();
    
    // Aquí necesitas pasar un payload al token, por ejemplo el id del usuario
    const token = await createAccessToken({ userId: userSaved._id });

    res.cookie('token', token); // Envía el token en la cookie
    res.json({ 
        id: userSaved._id,
        username: userSaved,
        email: userSaved,
        createdAt : userSaved.createdAt,
        updatedAt : userSaved.updatedAt
        
        
    });

  } catch (error) {
      res.status(500).json({ error: 'Error en el registro' });
  }
};




export const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    const Userfound = await User.findOne({ email });
    if (!Userfound) {
      return res.status(401).json({ error: 'Credenciales incorrectas' });
    }

    const validPassword = await bcrypt.compare(password, Userfound.password);
    if (!validPassword) {
      return res.status(401).json({ error: 'Credenciales incorrectas' });
    }
    
    // Aquí necesitas pasar un payload al token, por ejemplo el id del usuario
    const token = await createAccessToken({ userId: Userfound._id });

    res.cookie('token', token); // Envía el token en la cookie
    res.json({ 
        id: Userfound._id,
        username: Userfound.username,
        email: Userfound.email,
        createdAt: Userfound.createdAt,
        updatedAt: Userfound.updatedAt
    });

  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const logout = async (req, res) => {
  res.cookie('token', "", {
    expires: new Date(0),

  });
  return res.sendStatus(200);  
}

export const profile = async (req, res) => {
  try {
    // Asegúrate de que req.user.userId tenga el ID del usuario
    const user = await User.findById(req.user.userId);

    if (!user) {
      return res.status(404).json({ msg: 'Usuario no encontrado' });
    }

    res.status(200).json({ 
      id: user._id,
      username: user.username,
      email: user.email,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt
    });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
