import Product from "../MODELS/products.js";

export async function getProduct(req, res) {
    const products = await product.find()
    res.json(products)
}

export async function postProduct(req, res) {
    const body = req.body
    let msg = 'Product inserted succesful'
    try {
        const products = new product(body)
        await products.save()
    } catch (error) {
        msg = error
    }
    res.json({msg:msg})
}

export async function putProduct(req, res) {
    const {name, reference, units, price} = req.body
    let msg = 'Product update succesful'
    try {
        await Product.findByIdAndUpdate(req.params.id, {name, reference, units, price})
    } catch (error) {
        msg = error
    }
    res.json({msg:msg})
}

export async function deleteProduct(req, res) {
    const id = req.params.id
    try {
        await  Product.findByIdAndDelete(id)
        res.json('Product deleted succesfully')
    } catch (error) {
        res.status(500).json(error,{msg:'There was problem deleting the Product'})
    }
}