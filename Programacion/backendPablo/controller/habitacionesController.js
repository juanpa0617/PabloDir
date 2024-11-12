import { log } from 'console';
import { Room } from '../models/rooms.js';
import multer from 'multer';
import path from 'path';

// Configuración de Multer para subir imágenes
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/"); // Carpeta donde se almacenarán las imágenes
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname)); // Nombre único para cada archivo
  },
});
const upload = multer({ storage: storage }).single('imagen'); // Solo un archivo llamado 'imagen'

export async function getRooms(req, res) {
  try {
    const rooms = await Room.find();
    res.json(rooms);
  } catch (error) {
    res.status(500).json({ message: "Error al obtener las habitaciones" });
  }
}

export async function createRoom(req, res) {
  upload(req, res, async function (err) {
    if (err) {
      console.error("Error al subir la imagen:", err);
      return res.status(400).json({ message: "Error al subir la imagen" });
    }

    try {
      const comodidadesIds = req.body.comodidades.map((id) => mongoose.Types.ObjectId(id));
      const room = new Room({
        nombre: req.body.nombre,
        capacidad: req.body.capacidad,
        estado: req.body.estado,
        descripcion: req.body.descripcion,
        imagen: req.file ? req.file.filename : null,
        comodidades: comodidadesIds,
      });

      await room.save();
      res.json(room);
    } catch (err) {
      console.error("Error al crear la habitación:", err);
      res.status(500).json({ message: "Error al crear la habitación" });
    }
  });
}

export async function updateRoom(req, res) {
  upload(req, res, async function (err) {
    if (err) {
      return res.status(400).json({ message: "Error al subir la imagen" });
    }

    try {
      const room = await Room.findById(req.params.id);
      if (!room) {
        return res.status(404).json({ message: "Habitación no encontrada" });
      }

      // Actualizar los campos
      room.nombre = req.body.nombre || room.nombre;
      room.capacidad = req.body.capacidad || room.capacidad;
      room.estado = req.body.estado || room.estado;
      room.descripcion = req.body.descripcion || room.descripcion;
      room.comodidades = req.body.comodidades || room.comodidades;

      // Si se subió una nueva imagen, la actualizamos
      if (req.file) {
        room.imagen = req.file.filename;
      }

      await room.save();
      res.json(room);
    } catch (error) {
      res.status(500).json({ message: "Error al actualizar la habitación" });
    }
  });
}

export async function deleteRoom(req, res) {
  try {
    const room = await Room.findByIdAndDelete(req.params.id);
    if (!room) {
      return res.status(404).json({ message: "Habitación no encontrada" });
    }
    res.json({ message: "Habitación eliminada con éxito" });
  } catch (error) {
    res.status(500).json({ message: "Error al eliminar la habitación" });
  }
}

export async function getRoom(req, res) {
  try {
    const room = await Room.findById(req.params.id);
    if (!room) {
      return res.status(404).json({ message: "Habitación no encontrada" });
    }
    res.json(room);
  } catch (error) {
    res.status(500).json({ message: "Error al obtener la habitación" });
  }
}
