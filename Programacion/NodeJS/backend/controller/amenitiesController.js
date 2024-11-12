import Amenities from "../model/Amenities.js";

export const getAllAmenities = async (req, res) => {
  try {
    const amenities = await Amenities.find();
    res.status(200).json(amenities);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error fetching amenities", error: error.message });
  }
};

export const createAmenities = async (req, res) => {
  try {
    const { articulos, observacion, fechaIngreso, estado } = req.body;
    if (!articulos || !observacion || !fechaIngreso || estado === undefined) {
      return res.status(400).json({ message: "Please fill in all fields" });
    }
    if (!["Disponible", "En reparación", "No disponible"].includes(estado)) {
      return res
        .status(400)
        .json({
          message:
            "Invalid state. Must be 'Disponible', 'En reparación', or 'No disponible'",
        });
    }
    const amenities = new Amenities(req.body);
    await amenities.save();
    res.status(201).json({ message: "Guardado exitosamente", amenities });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error creating amenities", error: error.message });
  }
};

export const updateAmenities = async (req, res) => {
  try {
    const { id } = req.params;
    if (!id) {
      return res.status(400).json({ message: 'ID de la comodidad no proporcionado' });
    }
    const { estado } = req.body;
    if (estado && !['Disponible', 'En reparación', 'No disponible'].includes(estado)) {
      return res.status(400).json({ message: "Invalid state. Must be 'Disponible', 'En reparación', or 'No disponible'" });
    }
    const amenities = await Amenities.findByIdAndUpdate(id, req.body, { new: true });
    if (!amenities) {
      return res.status(404).json({ message: "Amenities not found" });
    }
    res.json({ message: "Amenities updated successfully", amenities });
  } catch (error) {
    console.error('Error updating amenities:', error);
    res.status(500).json({ message: "Error updating amenities", error: error.message });
  }
};



export const deleteAmenities = async (req, res) => {
  try {
    const amenities = await Amenities.findByIdAndDelete(req.params.id);
    if (!amenities) {
      return res.status(404).json({ message: "Amenities not found" });
    }
    res.json({ message: "Amenities deleted successfully", amenities });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error deleting amenities", error: error.message });
  }
};

export const getAmenitiesById = async (req, res) => {
  try {
    const amenities = await Amenities.findById(req.params.id);
    if (!amenities) {
      return res.status(404).json({ message: "Amenities not found" });
    }
    res.json(amenities);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error getting amenities", error: error.message });
  }
};
