import Sale from '../models/Sale.js';
import Product from '../models/Product.js';
export const getSales = async (req, res) => {
  try {
    const sales = await Sale.find().populate('referenciaProduct');
    res.json(sales);
  } catch (error) {
    res.status(500).json({ msg: "Error al obtener las ventas" });
  }
};

export const createSale = async (req, res) => {
  const { idsale, referenciaProduct, totalUnits } = req.body;

  try {
    const product = await Product.findById(referenciaProduct);

    if (!product) {
      return res.status(404).json({ msg: "Producto no encontrado" });
    }

    if (product.units < totalUnits) {
      return res.status(400).json({ msg: "No hay suficientes unidades disponibles" });
    }

    product.units -= totalUnits;
    await product.save();

    const newSale = new Sale({ idsale, referenciaProduct, totalUnits });
    const savedSale = await newSale.save();

    res.json(savedSale);
  } catch (error) {
    res.status(500).json({ msg: "Error al crear la venta" });
  }
};

export const getSale = async (req, res) => {
  try {
    const sale = await Sale.findById(req.params.id).populate('referenciaProduct');
    if (!sale) return res.status(404).json({ msg: "Venta no encontrada" });
    res.json(sale);
  } catch (error) {
    res.status(500).json({ msg: "Error al obtener la venta" });
  }
};

export const updateSale = async (req, res) => {
  try {
    const updatedSale = await Sale.findByIdAndUpdate(req.params.id, req.body, { new: true }).populate('referenciaProduct');
    if (!updatedSale) return res.status(404).json({ msg: "Venta no encontrada" });
    res.json(updatedSale);
  } catch (error) {
    res.status(500).json({ msg: "Error al actualizar la venta" });
  }
};

export const deleteSale = async (req, res) => {
  try {
    const deletedSale = await Sale.findByIdAndDelete(req.params.id);
    if (!deletedSale) return res.status(404).json({ msg: "Venta no encontrada" });
    res.json(deletedSale);
  } catch (error) {
    res.status(500).json({ msg: "Error al eliminar la venta" });
  }
};
