import Comodidades from '../models/comodidades.js';

// Obtener todas las comodidades
export async function getComodidades(req, res) {
  try {
    const comodidades = await Comodidades.find();
    console.log(comodidades);
    
    res.json(comodidades);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al obtener comodidades" });
  }
}

// Obtener una comodidad por ID
export async function getComodidadeById(req, res) {
  const { id } = req.params;
  try {
    const comodidade = await Comodidades.findById(id);
    if (!comodidade) {
      return res.status(404).json({ message: "Comodidade no encontrada" });
    }
    res.json(comodidade);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al obtener la comodidad" });
  }
}


export  async function postComodidades(req, res) {
  const body  = req.body;
  try {
    const comodidade = new Comodidades(body);
    await comodidade.save();
    res.json(comodidade);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Error al crear la comodidad" });
      }
      }



// Actualizar una comodidad
export async function putComodidades(req, res) {
  const { id } = req.params;
  const body = req.body;
  try {
    const comodidades = await Comodidades.findByIdAndUpdate(id, body, {
      new: true,
    });
    if (!comodidades) {
      return res.status(404).json({ message: "Comodidade no encontrada" });
    }
    res.json({ msg: "Comodidade actualizada con éxito", comodidades });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al actualizar la comodidad" });
  }
}

// Eliminar una comodidad
export async function deleteComodidades(req, res) {
  const { id } = req.params;

  // Validar el formato del ID
  if (!id || !mongoose.Types.ObjectId.isValid(id)) {
    return res.status(400).json({ message: 'ID no válido' });
  }

  try {
    const comodidades = await Comodidades.findByIdAndDelete(id);
    if (!comodidades) {
      return res.status(404).json({ message: 'Comodidad no encontrada' });
    }
    res.json({ msg: 'Comodidad eliminada con éxito', comodidades });
  } catch (error) {
    console.error('Error al eliminar la comodidad:', error);
    res.status(500).json({ message: 'Error al eliminar la comodidad' });
  }
}