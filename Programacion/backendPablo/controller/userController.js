import { User } from '../models/users.js';
import bcrypt   from 'bcryptjs';
import generatePassword from '../utils/generatePassword.js'



export async function postUser(req, res) {
    const body = req.body;
    try {
        const saltRounds = 10;
        const password = generatePassword(); 
        const hashedPassword = await bcrypt.hash(password, saltRounds);

        const user = new User({
            nombre: body.nombre,
            documento: body.documento,
            email: body.email,
            telefono: body.telefono,
            rol: body.rol,
            contraseña: hashedPassword,
            
        }
      );
        

        await user.save();
        res.status(201).json({ 
            message: 'Usuario agregado',
            user: {
                _id: user._id,
                nombre: user.nombre,
                documento: user.documento,
                email: user.email,
                telefono: user.telefono,
                rol: user.rol,
                contraseñaviwe:password
                },
        });
    } catch (error) {
        if (error.name === 'ValidationError') {
            res.status(400).json({ message: 'Validación fallida', errors: error.errors });
        } else {
            console.error(error);
            res.status(500).json({ message: 'Error interno del servidor' });
        }
    }
}

  
  export async function putUser(req, res) {
    const { id } = req.params;
    const body = req.body;
  
    try {
      const user = await User.findById(id);
      if (!user) return res.status(404).json({ message: 'Usuario no encontrado' });
  
      user.nombre = body.nombre;
      user.documento = body.documento;
      user.email = body.email;
      user.telefono = body.telefono;
      user.rol = body.rol;
  
      if (body.contraseña) {
        const saltRounds = 10;
        const hashedPassword = await bcrypt.hash(body.contraseña, saltRounds);
        user.contraseña = hashedPassword;
      }
  
      await user.save();
      res.json({ message: 'Usuario actualizado', user });
    } catch (error) {
      if (error.name === 'ValidationError') {
        res.status(400).json({ message: 'Validación fallida', errors: error.errors });
      } else {
        console.error(error);
        res.status(500).json({ message: 'Error interno del servidor' });
      }
    }
  }
  
  export async function getUserById(req, res) {
    const { id } = req.params;
    try {
      const user = await User.findById(id);
      if (!user) return res.status(404).json({ message: 'Usuario no encontrado' });
      res.json(user);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Error interno del servidor' });
    }
  }
  
  export async function getAllUsers(req, res) {
    try {
      const users = await User.find();
      res.json(users);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Error interno del servidor' });
    }
  }
  
  export async function deleteUser(req, res) {
    const { id } = req.params;
    try {
        const user = await User.findByIdAndDelete(id); // Cambiado de findByIdAndRemove a findByIdAndDelete
        if (!user) return res.status(404).json({ message: 'Usuario no encontrado' });
        res.json({ message: 'Usuario eliminado' });
    } catch (error) {
        console.error('Error en deleteUser:', error.message);
        res.status(500).json({ message: 'Error interno del servidor', error: error.message });
    }
}

