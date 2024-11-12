||import Cuenta from "../models/Banco.js";
import bcryptjs from "bcryptjs";

export const getCuenta = async (req, res) => {
  try {
    const { numeroCuenta } = req.params;
    const cuenta = await Cuenta.findOne({ numeroCuenta });
    if (!cuenta) {
      return res.status(404).json({ error: "Cuenta no encontrada" });
    }
    res.json(cuenta);
  } catch (error) {
    res.status(500).json({ error: "Error al obtener la cuenta" });
  }
};

export const createCuenta = async (req, res) => {
  try {
    const { documentoCliente, claveAcceso, Sucursal } = req.body;

    const numeroCuenta = await Cuenta.getNextNumeroCuenta();
    const salt = await bcryptjs.genSalt(10);
    const hashedClaveAcceso = await bcryptjs.hash(claveAcceso, salt);

    const cuenta = new Cuenta({
      numeroCuenta,
      documentoCliente,
      Sucursal,
      claveAcceso: hashedClaveAcceso,
    });
    await cuenta.save();

    res.status(201).json(cuenta);
  } catch (error) {
    res.status(500).json({ error: "Error al crear la cuenta" });
  }
};

export const consignarDinero = async (req, res) => {
  try {
    const { numeroCuenta, monto } = req.body;
    if (monto <= 0) {
      return res.status(400).json({ error: "Monto inválido" });
    }

    const cuenta = await Cuenta.findOne({ numeroCuenta });
    if (!cuenta) {
      return res.status(404).json({ error: "Cuenta no encontrada" });
    }

    cuenta.saldo += monto;
    await cuenta.save();

    res.json(cuenta);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error al consignar el dinero" });
  }
};

export const retirarDinero = async (req, res) => {
  try {
    const { numeroCuenta, monto } = req.body;

    const cuenta = await Cuenta.findOne({ numeroCuenta });
    if (!cuenta) {
      return res.status(404).json({ error: "Cuenta no encontrada" });
    }

    if (monto > cuenta.saldo) {
      return res.status(400).json({ error: "Monto inválido" });
    }

    cuenta.saldo -= monto;
    await cuenta.save();

    res.json(cuenta);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error al retirar el dinero" });
  }
};

export const eliminarCuenta = async (req, res) => {
  try {
    const { numeroCuenta } = req.params;

    const cuenta = await Cuenta.findOne({ numeroCuenta });
    if (!cuenta) {
      return res.status(404).json({ error: "Cuenta no encontrada" });
    }

    if (cuenta.saldo !== 0) {
      return res.status(400).json({ error: "La cuenta debe tener saldo cero para eliminarla" });
    }

    await Cuenta.deleteOne({ numeroCuenta });

    res.json({ message: "Cuenta eliminada exitosamente" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error al eliminar la cuenta" });
  }
};

// Buscar por sucursal
export const buscarPorSucursal = async (req, res) => {
  try {
    const { Sucursal } = req.params;
    if (!Sucursal) {
      return res.status(400).json({ error: "Sucursal requerida" });
    }
    const cuentas = await Cuenta.find({ Sucursal });
    res.json(cuentas);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error al buscar cuentas por sucursal" });
  }
};

