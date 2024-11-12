import mongoose from 'mongoose';

const cuentaSchema = new mongoose.Schema({
  numeroCuenta: { type: Number, unique: true, required: true },
  documentoCliente: { type: String, required: true },
  fechaApertura: { type: Date, default: Date.now },
  saldo: { type: Number, default: 0 },
  claveAcceso: { type: String, required: true, minlength : 4 },
  Sucursal : {type: String}
});

cuentaSchema.statics.getNextNumeroCuenta = async function () {
  
  const lastCuenta = await this.findOne().sort({ numeroCuenta: -1 });
  return lastCuenta ? lastCuenta.numeroCuenta + 1 : 1;
};

export default mongoose.model('Cuenta', cuentaSchema);



// import mongoose from 'mongoose';

// const pedidoSchema = new mongoose.Schema({
//   idPedido: {
//     type: Number,
//     unique: true,
//     required: true
//   },
//   nombreCliente: {
//     type: String,
//     required: true
//   },
//   direccionEnvio: {
//     type: String,
//     required: true
//   },
//   cantidad: {
//     type: Number,
//     required: true
//   },
//   precioUnidad: {
//     type: Number,
//     required: true
//   },
//   fecha: {
//     type: Date,
//     default: Date.now
//   },
//   valorTotal: {
//     type: Number
//   }
// });

// // Función estática para obtener el próximo idPedido autoincremental
// pedidoSchema.statics.getNextIdPedido = async function () {
//   const lastPedido = await this.findOne().sort({ idPedido: -1 });
//   return lastPedido ? lastPedido.idPedido + 1 : 1;
// };



// const Pedido = mongoose.model('Pedido', pedidoSchema);
// export default Pedido;
