import { Schema, model } from 'mongoose'

const salesSchema = new Schema({
    id: {
        type: Number,
        required: true,
        unique: true,
    },
    reference: {
        type: String,
        required: true,
        minlength: [2, 'The reference required minimus 2 characters.'],
    },
    date: {
        type: Date,
        required: [true, 'The date is required.'],
    },
    totUnits: {
        type: Number,
        required: [true, 'The total units is required.'],
    }
})
salesSchema.statics.getNextId = async function () {
    const lastCell = await this.findOne().sort({ id: -1 });
    return lastCell ? lastCell.id + 1 : 1;  //aqui realizamos el autoincrementable para exportarlo e importarlo en el post
};

export default model('Sales', salesSchema, 'sales')