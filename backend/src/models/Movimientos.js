const { Schema, model} = require('mongoose');

const userSchema = new Schema({
    dispositivo: String,
    direccion: String,
    fecha: String
});

module.exports = model('Movimientos', userSchema);