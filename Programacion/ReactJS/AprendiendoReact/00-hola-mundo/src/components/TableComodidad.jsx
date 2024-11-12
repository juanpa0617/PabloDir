import React, { useState, useEffect } from 'react';
import { Button, Table, Modal, Form } from 'react-bootstrap';
import Swal from 'sweetalert2';
import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:3000/api',
});

const TableComodidad = ({ comodidades = [], onUpdateComodidades }) => {
  const [selectedComodidad, setSelectedComodidad] = useState(null);
  const [showComodidadModal, setShowComodidadModal] = useState(false);
  const [data, setData] = useState(comodidades);

  useEffect(() => {
    const fetchComodidades = async () => {
      try {
        const response = await api.get('/amenities');
        setData(response.data);
      } catch (error) {
        console.error('Error fetching comodidades:', error);
      }
    };
    fetchComodidades();
  }, []);

  const handleAddComodidad = () => {
    setSelectedComodidad(null);
    setShowComodidadModal(true);
  };

  const handleSaveComodidad = async (comodidad) => {
    try {
      if (selectedComodidad) {
        // Edición
        await api.put(`/amenities/${comodidad.id}`, comodidad);
        setData(data.map((item) => (item.id === comodidad.id ? comodidad : item)));
        Swal.fire({
          icon: 'success',
          title: 'Éxito',
          text: 'Comodidad actualizada correctamente',
          timer: 2000,
          showConfirmButton: false
        });
      } else {
        // Adición
        await api.post('/amenities', comodidad);
        setData([...data, { ...comodidad, id: Date.now() }]); // El backend debería asignar el ID
        Swal.fire({
          icon: 'success',
          title: 'Éxito',
          text: 'Comodidad agregada correctamente',
          timer: 2000,
          showConfirmButton: false
        });
      }
      setShowComodidadModal(false);
    } catch (error) {
      console.error('Error saving comodidad:', error);
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'No se pudo guardar la comodidad',
      });
    }
  };

  const handleEditComodidad = (comodidad) => {
    Swal.fire({
      title: '¿Estás seguro de editar esta comodidad?',
      text: 'Esta acción no se puede deshacer',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí, editar',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        setSelectedComodidad({ ...comodidad });
        setShowComodidadModal(true);
      }
    });
  };

  const handleDeleteComodidad = async (id) => {
    try {
      await api.delete(`/amenities/${id}`);
      setData(data.filter((item) => item.id !== id));
      Swal.fire({
        icon: 'success',
        title: 'Eliminado',
        text: 'Comodidad eliminada correctamente',
        timer: 2000,
        showConfirmButton: false
      });
    } catch (error) {
      console.error('Error deleting comodidad:', error);
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'No se pudo eliminar la comodidad',
      });
    }
  };

  return (
    <div>
      <Button onClick={handleAddComodidad}>Agregar Comodidad</Button>
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>ID</th>
            <th>Artículos</th>
            <th>Observación</th>
            <th>Fecha de Ingreso</th>
            <th>Estado</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {data && data.length > 0 ? (
            data.map((comodidad) => (
              <tr key={comodidad.id}>
                <td>{comodidad.id}</td>
                <td>{comodidad.articulos}</td>
                <td>{comodidad.observacion}</td>
                <td>{new Date(comodidad.fechaIngreso).toLocaleDateString()}</td>
                <td>{comodidad.estado}</td>
                <td>
                  <Button variant="info" onClick={() => handleEditComodidad(comodidad)}>Editar</Button>
                  <Button variant="danger" onClick={() => handleDeleteComodidad(comodidad.id)}>Eliminar</Button>
                </td>
              </tr>
            ))
          ) : (
            <tr>
              <td colSpan="6">No hay comodidades registradas.</td>
            </tr>
          )}
        </tbody>
      </Table>

      {showComodidadModal && (
        <ModalComodidad
          show={showComodidadModal}
          onHide={() => setShowComodidadModal(false)}
          comodidad={selectedComodidad}
          onSave={handleSaveComodidad}
        />
      )}
    </div>
  );
};

// Modal para agregar/editar Comodidades
const ModalComodidad = ({ show, onHide, comodidad, onSave }) => {
  const [articulos, setArticulos] = useState(comodidad?.articulos || '');
  const [observacion, setObservacion] = useState(comodidad?.observacion || '');
  const [fechaIngreso, setFechaIngreso] = useState(comodidad?.fechaIngreso || '');
  const [estado, setEstado] = useState(comodidad?.estado || 'Disponible');
  const [id, setId] = useState(comodidad?.id || null);
  const [errors, setErrors] = useState({});

  useEffect(() => {
    const newErrors = {};
    if (articulos.trim() && articulos.trim().length < 2) {
      newErrors.articulos = 'Debe tener al menos 2 caracteres';
    }
    if (observacion.trim() && observacion.trim().length < 6) {
      newErrors.observacion = 'Debe tener al menos 6 caracteres';
    }
    if (fechaIngreso && isNaN(new Date(fechaIngreso).getTime())) {
      newErrors.fechaIngreso = 'Fecha inválida';
    }
    setErrors(newErrors);
  }, [articulos, observacion, fechaIngreso]);

  const handleSave = async () => {
    const newErrors = {};

    if (!articulos.trim()) newErrors.articulos = 'El campo Artículos es obligatorio';
    if (!observacion.trim()) newErrors.observacion = 'El campo Observación es obligatorio';
    if (!fechaIngreso) newErrors.fechaIngreso = 'El campo Fecha de Ingreso es obligatorio';
    if (fechaIngreso && isNaN(new Date(fechaIngreso).getTime())) newErrors.fechaIngreso = 'Fecha inválida';

    setErrors(newErrors);

    if (Object.keys(newErrors).length > 0) {
      Swal.fire({
        title: 'Errores en el formulario',
        html: Object.values(newErrors).join('<br>'),
        icon: 'error',
        confirmButtonText: 'Ok',
      });
    } else {
      await onSave({ id, articulos, observacion, fechaIngreso, estado });
    }
  };

  return (
    <Modal show={show} onHide={onHide} size="lg">
      <Modal.Header closeButton>
        <Modal.Title>{comodidad ? 'Editar Comodidad' : 'Agregar Comodidad'}</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group>
            <Form.Label>Artículos</Form.Label>
            <Form.Control
              type="text"
              value={articulos}
              onChange={(e) => setArticulos(e.target.value)}
              isInvalid={!!errors.articulos}
            />
            <Form.Control.Feedback type="invalid">
              {errors.articulos}
            </Form.Control.Feedback>
          </Form.Group>
          <Form.Group>
            <Form.Label>Observación</Form.Label>
            <Form.Control
              type="text"
              value={observacion}
              onChange={(e) => setObservacion(e.target.value)}
              isInvalid={!!errors.observacion}
            />
            <Form.Control.Feedback type="invalid">
              {errors.observacion}
            </Form.Control.Feedback>
          </Form.Group>
          <Form.Group>
            <Form.Label>Fecha de Ingreso</Form.Label>
            <Form.Control
              type="date"
              value={fechaIngreso}
              onChange={(e) => setFechaIngreso(e.target.value)}
              isInvalid={!!errors.fechaIngreso}
            />
            <Form.Control.Feedback type="invalid">
              {errors.fechaIngreso}
            </Form.Control.Feedback>
          </Form.Group>
          <Form.Group>
            <Form.Label>Estado</Form.Label>
            <Form.Control
              as="select"
              value={estado}
              onChange={(e) => setEstado(e.target.value)}
            >
              <option>Disponible</option>
              <option>No Disponible</option>
            </Form.Control>
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={onHide}>Cerrar</Button>
        <Button variant="primary" onClick={handleSave}>
          {comodidad ? 'Actualizar' : 'Agregar'}
        </Button>
      </Modal.Footer>
    </Modal>
  );
};

export default TableComodidad;
