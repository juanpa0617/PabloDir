import mongoose from 'mongoose';

const saleSchema = new mongoose.Schema({
  idsale: {
    type: String,
    required: true,
    unique: true
  },
  referenciaProduct: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Product',
    required: true
  },
  date: {
    type: Date,
    default: Date.now
  },
  totalUnits: {
    type: Number,
    required: true,
    min: 1 
  }
}, {
  timestamps: true
});

export default mongoose.model('Sale', saleSchema);
