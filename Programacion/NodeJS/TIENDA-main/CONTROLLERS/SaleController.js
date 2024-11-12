import Sales from "../MODELS/sales.js";

export async function getSale(req, res) {
    const sales = await Sales.find()
    res.json(sales)
}

export async function postSales(req, res) {
    const id = await Sales.getNextId()
    const body = req.body
    let msg = 'sale inserted succesful'
    try {
        const sales = new Sales(body)
        sales.id = id // aqui esta tomando el id que se tiene en la constante  const id  linea 9/ y se le asigna al id de la factura (sales) que esta creando
        await sales.save()
    } catch (error) {
        msg = error
    }
    res.json({ msg: msg })
}

export async function putSales(req, res) {
    const { id, reference, date, totUnits } = req.body
    let msg = 'Sale update succesful'
    try {
        await Sales.updateOne({ id: id }, { reference: reference, date: date, totUnits: totUnits })
    } catch (error) {
        msg = error
    }
    res.json({ msg: msg })
}

export async function deleteSales(req, res) {
    const id = req.params.id
    try {
        await Sales.deleteOne({ id: id })
        res.json('Sale deleted succesfully')
    } catch (error) {
        res.status(500).json(error, { msg: 'There was problem deleting the Sale' })
    }
}