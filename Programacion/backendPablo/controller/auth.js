import Auth from '../models/auth.js';
import bcryptjs from 'bcryptjs';
import jwt from 'jsonwebtoken'; // Importa jwt
import { TOKEN_SECRET } from "../config.js";
import { createAccessToken } from '../helpers/jwt.js';

export async function register(req, res) {
  try {
    const { fullName, identification, birthDate, email, password } = req.body;

    const existingUser = await Auth.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ error: 'El correo electrónico ya está en uso' });
    }

    const salt = await bcryptjs.genSalt(10);
    const hashedPassword = await bcryptjs.hash(password, salt);

    const newUser = new Auth({
      fullName,
      identification,
      birthDate,
      email,
      password: hashedPassword,
    });

    const userSaved = await newUser.save();

    const token = await createAccessToken({ userId: userSaved._id });
    res.cookie('token', token, { httpOnly: true });
    res.status(201).json({
      id: userSaved._id,
      fullName: userSaved.fullName,
      email: userSaved.email,
      createdAt: userSaved.createdAt,
      updatedAt: userSaved.updatedAt,
    });
  } catch (error) {
    console.error('Error en el registro:', error);
    res.status(500).json({ error: 'Error en el registro' });
  }
}

export async function login(req, res) {
  try {
    const { email, password } = req.body;

    const user = await Auth.findOne({ email });
    if (!user) {
      return res.status(401).json({ error: 'Credenciales incorrectas' });
    }

    const validPassword = await bcryptjs.compare(password, user.password);
    if (!validPassword) {
      return res.status(401).json({ error: 'Credenciales incorrectas' });
    }

    const token = await createAccessToken({ userId: user._id });
    res.cookie('token', token, { httpOnly: true });
    res.json({
      id: user._id,
      fullName: user.fullName,
      email: user.email,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
}

export async function logout(req, res) {
  res.cookie('token', '', {
    expires: new Date(0),
  });
  return res.sendStatus(200);  
}

export const verifyToken = async (req, res, next) => {
  if (!req.cookies) {
    return res.status(401).json({ error: 'No cookies found' });
  }

  const { token } = req.cookies;
  if (!token) {
    return res.status(401).json({ error: 'No token found' });
  }

  jwt.verify(token, TOKEN_SECRET, async (error, user) => {
    if (error) {
      return res.status(401).json({ error: 'Invalid token' });
    }

    const userFound = await Auth.findById(user.userId);
    if (!userFound) {
      return res.status(401).json({ error: 'User not found' });
    }

    req.user = userFound;
    next();
  });
};

export async function profile(req, res) {
  try {
    const user = req.user; // Usa req.user que se establece en verifyToken

    if (!user) {
      return res.status(404).json({ msg: 'Usuario no encontrado' });
    }

    res.status(200).json({
      id: user._id,
      fullName: user.fullName,
      email: user.email,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
}

export async function updateProfile(req, res) {
  try {
    const { fullName, identification, birthDate, email, password } = req.body;

    const user = req.user; // Usa req.user que se establece en verifyToken

    if (email && email !== user.email) {
      const emailExists = await Auth.findOne({ email });
      if (emailExists) {
        return res.status(400).json({ message: 'Email ya está en uso' });
      }
    }

    user.fullName = fullName || user.fullName;
    user.identification = identification || user.identification;
    user.birthDate = birthDate || user.birthDate;
    user.email = email || user.email;

    if (password) {
      const salt = await bcryptjs.genSalt(10);
      user.password = await bcryptjs.hash(password, salt);
    }

    await user.save();
    res.json({ message: 'Perfil actualizado correctamente', user });
  } catch (error) {
    console.error('Error actualizando el perfil:', error);
    res.status(500).json({ message: 'Error actualizando el perfil', error });
  }
}