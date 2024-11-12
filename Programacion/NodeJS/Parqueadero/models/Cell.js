import mongoose from 'mongoose';

const cellSchema = new mongoose.Schema({
  numeroCelda: { type: Number, required: true, unique: true },
  estado: { type: String, enum: ['disponible', 'no disponible'], default: 'disponible' },
  placaVehiculo: { type: String, maxlength: 6 },
  fechaIngreso: { type: Date },
  fechaSalida: { type: Date },
  pin: { type: String }
},
  { timestamps: true },
  { versionKey: false }
);

// Método estático para obtener el siguiente número de celda
cellSchema.statics.getNextNumeroCelda = async function() {
  const lastCell = await this.findOne().sort({ numeroCelda: -1 });
  return lastCell ? lastCell.numeroCelda + 1 : 1;
};

// Crear el modelo
const Cell = mongoose.model('Cell', cellSchema);

export default Cell;







// javascript
// Edit
// Copy code
// // models/Cuenta.js
// import mongoose, { Schema } from 'mongoose';
// import bcrypt from 'bcryptjs';

// const cuentaSchema = new Schema({
//   numeroCuenta: { type: Number, unique: true, required: true },
//   documentoCliente: { type: String, required: true },
//   fechaApertura: { type: Date, default: Date.now },
//   saldo: { type: Number, default: 0 },
//   claveAcceso: { type: String, required: true }
// });

// cuentaSchema.pre('save', async function(next) {
//   if (this.isNew || this.isModified('claveAcceso')) {
//     const salt = await bcrypt.genSalt(10);
//     this.claveAcceso = await bcrypt.hash(this.claveAcceso, salt);
//   }
//   next();
// });

// const Cuenta = mongoose.model('Cuenta', cuentaSchema);

// export default Cuenta;
// Controlador

// javascript
// Edit
// Copy code
// // controllers/CuentaController.js
// import Cuenta from '../models/Cuenta.js';
// import bcrypt from 'bcryptjs';

// // Listar los datos de una cuenta
// export const getCuenta = async (req, res) => {
//   try {
//     const cuenta = await Cuenta.findById(req.params.id);
//     if (!cuenta) {
//       return res.status(404).json({ error: 'Cuenta no encontrada' });
//     }
//     res.json(cuenta);
//   } catch (error) {
//     res.status(500).json({ error: 'Error al obtener la cuenta' });
//   }
// };

// // Crear una cuenta
// export const createCuenta = async (req, res) => {
//   try {
//     const { documentoCliente, claveAcceso } = req.body;
//     const numeroCuenta = await Cuenta.countDocuments() + 1;
//     const cuenta = new Cuenta({ numeroCuenta, documentoCliente, claveAcceso });
//     await cuenta.save();
//     res.status(201).json(cuenta);
//   } catch (error) {
//     res.status(500).json({ error: 'Error al crear la cuenta' });
//   }
// };

// // Consignar dinero en la cuenta
// export const consignar = async (req, res) => {
//   try {
//     const { id } = req.params;
//     const { monto } = req.body;
//     if (monto < 0) {
//       return res.status(400).json({ error: 'No se pueden consignar valores negativos' });
//     }
//     const cuenta = await Cuenta.findById(id);
//     if (!cuenta) {
//       return res.status(404).json({ error: 'Cuenta no encontrada' });
//     }
//     cuenta.saldo += monto;
//     await cuenta.save();
//     res.json(cuenta);
//   } catch (error) {
//     res.status(500).json({ error: 'Error al consignar' });
//   }
// };

// // Retirar dinero de la cuenta
// export const retirar = async (req, res) => {
//   try {
//     const { id } = req.params;
//     const { monto } = req.body;
//     if (monto < 0) {
//       return res.status(400).json({ error: 'No se pueden retirar valores negativos' });
//     }
//     const cuenta = await Cuenta.findById(id);
//     if (!cuenta) {
//       return res.status(404).json({ error: 'Cuenta no encontrada' });
//     }
//     if (cuenta.saldo < monto) {
//       return res.status(400).json({ error: 'No hay suficiente saldo para retirar' });
//     }
//     cuenta.saldo -= monto;
//     await cuenta.save();
//     res.json(cuenta);
//   } catch (error) {
//     res.status(500).json({ error: 'Error al retirar' });
//   }
// };

// // Eliminar una cuenta
// export const deleteCuenta = async (req, res) => {
//   try {
//     const { id } = req.params;
//     const cuenta = await Cuenta.findById(id);
//     if (!cuenta) {
//       return res.status(404).json({ error: 'Cuenta no encontrada' });
//     }
//     if (cuenta.saldo > 0) {
//       return res.status(400).json({ error: 'No se puede eliminar una cuenta con saldo' });
//     }
//     await cuenta.remove();
//     res.json({ message: 'Cuenta eliminada con éxito' });
//   } catch (error) {
//     res.status(500).json({ error: 'Error al eliminar la cuenta' });
//   }
// };
// Rutas

// javascript
// Edit
// Copy code
// // routes/index.js
// import express from 'express';
// import CuentaController from '../controllers/CuentaController.js';

// const router = express.Router();

// router.get('/cuentas/:id', CuentaController.getCuenta);
// router.post

// falto


// It seems like you were trying to complete the routes for the API. Here is the rest of the code:

// javascript
// Edit
// Copy code
// // routes/index.js
// import express from 'express';
// import CuentaController from '../controllers/CuentaController.js';

// const router = express.Router();

// router.get('/cuentas/:id', CuentaController.getCuenta);
// router.post('/cuentas', CuentaController.createCuenta);
// router.put('/cuentas/:id', CuentaController.consignar);
// router.put('/cuentas/:id/retirar', CuentaController.retirar);
// router.delete('/cuentas/:id', CuentaController.deleteCuenta);

// export default router;