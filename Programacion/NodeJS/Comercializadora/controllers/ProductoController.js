import Product from '../models/Product.js';

// Obtener todos los productos
export const getProducts = async (req, res) => {
  try {
    const products = await Product.find();
    res.json(products);
  } catch (error) {
    res.status(500).json({ msg: "Error al obtener los productos" });
  }
};

// Crear un nuevo producto
export const createProduct = async (req, res) => {
  const { reference, name, price, units } = req.body;

  if (price <= 0) {
    return res.status(400).json({ msg: "El precio debe ser mayor a 0" });
  }

  try {
    const newProduct = new Product({ reference, name, price, units });
    const savedProduct = await newProduct.save();
    res.json(savedProduct);
  } catch (error) {
    res.status(500).json({ msg: "Error al crear el producto" });
  }
};

// Obtener un producto por ID
export const getProduct = async (req, res) => {
  try {
    const product = await Product.findById(req.params.id);
    if (!product) return res.status(404).json({ msg: "Producto no encontrado" });
    res.json(product);
  } catch (error) {
    res.status(500).json({ msg: "Error al obtener el producto" });
  }
};

// Actualizar un producto
export const updateProduct = async (req, res) => {
  const { price } = req.body;

  if (price <= 0) {
    return res.status(400).json({ msg: "El precio debe ser mayor a 0" });
  }

  try {
    const updatedProduct = await Product.findByIdAndUpdate(req.params.id, req.body, { new: true });
    if (!updatedProduct) return res.status(404).json({ msg: "Producto no encontrado" });
    res.json(updatedProduct);
  } catch (error) {
    res.status(500).json({ msg: "Error al actualizar el producto" });
  }
};

// Eliminar un producto
export const deleteProduct = async (req, res) => {
  try {
    const deletedProduct = await Product.findByIdAndDelete(req.params.id);
    if (!deletedProduct) return res.status(404).json({ msg: "Producto no encontrado" });
    res.json(deletedProduct);
  } catch (error) {
    res.status(500).json({ msg: "Error al eliminar el producto" });
  }
};
