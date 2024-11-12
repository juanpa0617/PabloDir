import bcrypt from "bcryptjs"; //Para realizar incriptaciones  de contraseñas o otros documentos
import generateJWT from "../helpers/generateJWT.js";
import User from "../models/user.js";
//bcrypt
// import User from '../models/user.js';

// // Obtener todos los usuarios
// export async function getUser(req, res) {
//     try {
//         const users = await User.find();
//         res.json(users);
//     } catch (error) {
//         res.status(500).json({ msg: 'Error fetching users', error: error.message });
//     }
// }

// // Crear un nuevo usuario
// export async function postUser(req, res) {
//     const body = req.body;
//     try {
//         const user = new User(body);
//   <      await user.save();
//         res.status(201).json({ msg: 'User inserted successfully', user });
//     } catch (error) {
//         res.status(400).json({ msg: 'Error inserting user', error: error.message });
//     }
// }

// // Actualizar un usuario por ID
// export async function putUser(req, res) {
//     const id = req.params.id;
//     const body = req.body;
//     try {
//         const user = await User.findByIdAndUpdate(id, body, { new: true });
//         if (!user) {
//             return res.status(404).json({ msg: 'User not found' });
//         }
//         res.json({ msg: 'User updated successfully', user });
//     } catch (error) {
//         res.status(400).json({ msg: 'Error updating user', error: error.message });
//     }
// }

// // Eliminar un usuario por ID
// export async function deleteUser(req, res) {
//     const id = req.params.id;
//     try {
//         const user = await User.findByIdAndDelete(id);
//         if (!user) {
//             return res.status(404).json({ msg: 'User not found' });
//         }
//         res.json({ msg: 'User deleted successfully' });
//     } catch (error) {
//         res.status(400).json({ msg: 'Error deleting user', error: error.message });
//     }
// }


export async function postUser(req, res) {
  const body = req.body;
  
  //guardar informacion
  try {
    const user = new User(body);
    user.password = await bcrypt.hash(body.password, 10);
    console.log(user);
    
    await user.save();
    res.status(201).json({ msg: "User created successfully", user });
  } catch (error) {
    res.status(409).json({ msg: body });
  }
}

export async function login(req, res) {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(404).json({ msg: "User not found" });
    }

    const isLogged = await bcrypt.compare(password, user.password);

    if (isLogged) {
      const token =  await generateJWT(user._id); 
      res.status(200).json({ msg:  token}); // Corregido
    } else {
      res.status(404).json({ msg: "Email or password is incorrect" });
    }
  } catch (error) {
    res.status(503).json({ msg: "Error logging in", error: error.message });
  }
}



const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const cuentaSchema = new mongoose.Schema({
  numeroCuenta: { type: Number, unique: true, autoIncrement: true },
  documentoCliente: { type: String, required: true },
  fechaApertura: { type: Date, default: Date.now },
  saldo: { type: Number, default: 0 },
  claveAcceso: { type: String, required: true }
});

cuentaSchema.pre('save', async function(next) {
  if (this.isNew) {
    this.claveAcceso = await bcrypt.hash(this.claveAcceso, 10);
  }
  next();
});

const Cuenta = mongoose.model('Cuenta', cuentaSchema);

// module.exports = Cuenta;
// controllers/CuentaController.js

// javascript
// Edit
// Copy code
// const express = require('express');
// const router = express.Router();
// const Cuenta = require('../models/Cuenta');

// // Listar los datos de una cuenta
// router.get('/:numeroCuenta', async (req, res) => {
//   try {
//     const cuenta = await Cuenta.findOne({ numeroCuenta: req.params.numeroCuenta });
//     if (!cuenta) {
//       return res.status(404).json({ msg: 'Cuenta no encontrada' });
//     }
//     res.json(cuenta);
//   } catch (error) {
//     res.status(500).json({ msg: 'Error al obtener la cuenta', error: error.message });
//   }
// });

// // Crear una cuenta
// router.post('/', async (req, res) => {
//   try {
//     const cuenta = new Cuenta(req.body);
//     cuenta.numeroCuenta = await Cuenta.countDocuments() + 1;
//     await cuenta.save();
//     res.status(201).json({ msg: 'Cuenta creada con éxito', cuenta });
//   } catch (error) {
//     res.status(400).json({ msg: 'Error al crear la cuenta', error: error.message });
//   }
// });

// // Consignar dinero en la cuenta
// router.put('/:numeroCuenta/consignar', async (req, res) => {
//   try {
//     const cuenta = await Cuenta.findOne({ numeroCuenta: req.params.numeroCuenta });
//     if (!cuenta) {
//       return res.status(404).json({ msg: 'Cuenta no encontrada' });
//     }
//     if (req.body.monto <= 0) {
//       return res.status(400).json({ msg: 'El monto a consignar debe ser positivo' });
//     }
//     cuenta.saldo += req.body.monto;
//     await cuenta.save();
//     res.json({ msg: 'Consignación exitosa', cuenta });
//   } catch (error) {
//     res.status(500).json({ msg: 'Error al consignar', error: error.message });
//   }
// });

// // Retirar dinero de la cuenta
// router.put('/:numeroCuenta/retirar', async (req, res) => {
//   try {
//     const cuenta = await Cuenta.findOne({ numeroCuenta: req.params.numeroCuenta });
//     if (!cuenta) {
//       return res.status(404).json({ msg: 'Cuenta no encontrada' });
//     }
//     if (req.body.monto <= 0) {
//       return res.status(400).json({ msg: 'El monto a retirar debe ser positivo' });
//     }
//     if (req.body.monto > cuenta.saldo) {
//       return res.status(400).json({ msg: 'El monto a retirar supera el saldo de la cuenta' });
//     }
//     cuenta.saldo -= req.body.monto;
//     await cuenta.save();
//     res.json({ msg: 'Retiro exitoso', cuenta });
//   } catch (error) {
//     res.status(500).json({ msg: 'Error al retirar', error: error.message });
//   }
// });

// // Eliminar una cuenta
// router.delete('/:numeroCuenta', async (req, res) => {
//   try {
//     const cuenta = await Cuenta.findOne({ numeroCuenta: req.params.numeroCuenta });
//     if (!cuenta) {
//       return res.status(404).json({ msg: 'Cuenta no encontrada' });
//     }
//     if (cuenta.saldo !== 0) {
//       return res.status(400).json({ msg: 'La cuenta no puede ser eliminada porque tiene un saldo diferente de cero' });
//     }
//     await cuenta.remove();
//     res.json({ msg: 'Cuenta eliminada con éxito' });
//   } catch (error) {
//     res.status(500).json({ msg: 'Error al eliminar la cuenta', error: error.message });
//   }
// });

// module.exports = rout




// import Cuenta from '../models/Banco.js'; import bcryptjs from 'bcryptjs';

// export const getCuenta = async (req, res) => { try { const { numeroCuenta } = req.params; const cuenta = await Cuenta.findOne({ numeroCuenta }); if (!cuenta) { return res.status(404).json({ error: 'Cuenta no encontrada' }); } res.json(cuenta); } catch (error) { res.status(500).json({ error: 'Error al obtener la cuenta' }); } };

// //crear cuenta con la clave encriptda se solicitar el numero del cliente y clave export const crearCuenta = async (req, res) => { try {

// Edit
// Copy code
//     const { documentoCliente, claveAcceso } = req.body;
//     const encryptedPassword = bcryptjs.hashSync(claveAcceso, 10);
//     const cuenta = new Cuenta({ documentoCliente, claveAcceso: encryptedPassword });
//     await cuenta.save();
//     res.json(cuenta);
// } catch (error) {
//     res.status(500).json({ error: 'Error al crear la cuenta' });

// }
// } // Consignar dinero en la cuenta.

// Edit
// Copy code
// export const consignarDinero = async (req, res) => {
//   try {
//     const { numeroCuenta, monto } = req.body;
//     const cuenta = await Cuenta.findOne({ numeroCuenta });
//     if (!cuenta) {
//       return res.status(404).json({ error: 'Cuenta no encontrada' });
//     }
//     const nuevoSaldo = cuenta.saldo + monto;
//     cuenta.saldo = nuevoSaldo;
//     await cuenta.save();
//     res.json(cuenta);
//   } catch (error) {
//     res.status(500).json({ error: 'Error al consignar el dinero' });
//   }
// };

// // Retirar dinero de la cuenta.

// export const retirarDinero = async (req, res) => {
//   try {
//     const { numeroCuenta, monto } = req.body;
//     const cuenta = await Cuenta.findOne({ numeroCuenta });
//     if (!cuenta) {
//       return res.status(404).json({ error: 'Cuenta no encontrada' });
//     }
//     const nuevoSaldo = cuenta.saldo - monto;
//     if (nuevoSaldo < 0) {
//       return res.status(400).json({ error: 'Saldo insuficiente' });
//     }
//     cuenta.saldo = nuevoSaldo;
//     await cuenta.save();
//     res.json(cuenta);
//   } catch (error) {
//     res.status(500).json({ error: 'Error al retirar el dinero' });
//   }
// };

// //Eliminar cuenta

// export const eliminarCuenta = async (req, res) => {
//   try {
//     const { numeroCuenta } = req.body;
//     const cuenta = await Cuenta.findOne({ numeroCuenta });
//     if (!cuenta) {
//       return res.status(404).json({ error: 'Cuenta no encontrada' });
//     }
//     await Cuenta.deleteOne({ numeroCuenta });
//     res.json({ message: 'Cuenta eliminada exitosamente' });
//   } catch (error) {
//     res.status(500).json({ error: 'Error al eliminar la cuenta' });
//   }
// };
// { "error": "Error al crear la cuenta" }

// POST /api/cuentas 500 138.692 ms - 36


// El error que estás experimentando se debe a que no estás manejando adecuadamente los errores que pueden ocurrir al crear una nueva cuenta. En específico, el error 500 que estás viendo se debe a que el servidor no puede procesar la solicitud debido a un error interno.

// En este caso, el error puede estar relacionado con la creación de la cuenta en la base de datos. Aquí hay algunas posibles causas:

// Error de validación: Es posible que los datos que estás enviando en el cuerpo de la solicitud no sean válidos o no estén completos. Asegúrate de que estás enviando todos los campos requeridos y que los datos sean correctos.
// Error de conexión a la base de datos: Es posible que haya un problema con la conexión a la base de datos. Asegúrate de que la conexión esté configurada correctamente y que la base de datos esté disponible.
// Error de duplicidad: Es posible que estés intentando crear una cuenta con un número de cuenta que ya existe. Asegúrate de que estás generando un número de cuenta único para cada cuenta.
// Para solucionar este problema, te recomiendo agregar más información de depuración para que puedas entender mejor qué está sucediendo. Puedes hacer esto agregando console.log en el código para ver qué datos estás recibiendo y qué errores estás obteniendo.

// Aquí hay un ejemplo de cómo podrías modificar el código para agregar más información de depuración:

// javascript
// Edit
// Copy code
// export const crearCuenta = async (req, res) => {
//   try {
//     const { documentoCliente, claveAcceso } = req.body;
//     console.log('Datos de la cuenta:', documentoCliente, claveAcceso);
//     const encryptedPassword = bcryptjs.hashSync(claveAcceso, 10);
//     const cuenta = new Cuenta({ documentoCliente, claveAcceso: encryptedPassword });
//     console.log('Cuenta a crear:', cuenta);
//     await cuenta.save();
//     console.log('Cuenta creada exitosamente');
//     res.json(cuenta);
//   } catch (error) {
//     console.log('Error al crear la cuenta:', error);
//     res.status(500).json({ error: 'Error al crear la cuenta' });
//   }
// };
// Con esta información adicional, deberías poder entender mejor qué está sucediendo y solucionar el problema.