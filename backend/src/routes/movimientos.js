const { Router } = require('express');
const router = Router();
let now= new Date();
const casual  = require('casual');

const Movimientos = require('../models/Movimientos');
//Ordenar
function ordenarAsc(p_array_json, p_key) {
    p_array_json.sort(function (a, b) {
       return a[p_key] > b[p_key];
    });
 }
 function ordenarDesc(p_array_json, p_key) {
    ordenarAsc(p_array_json, p_key); p_array_json.reverse(); 
 }
//Consultar Movimientos
router.get('/api/movimientos', async (req, res) =>{
    const movimientos = await Movimientos.find();
    ordenarDesc(movimientos, '_id');
    res.json({movimientos});
});

//Girar a la Derecha
router.get('/api/movimientos/derecha', async (req, res) =>{
    for(let i = 0; i < 1; i++){
        await Movimientos.create({
            dispositivo: 'Movil',
            direccion: 'Derecha',
            fecha: now,   
        });
    }
    res.json({message: 'la Plataforma se Movio a la Derecha'});
})

//Girar a la Izquierda
router.get('/api/movimientos/izquierda', async (req, res) =>{
    for(let i = 0; i < 1; i++){
        await Movimientos.create({
            dispositivo: 'Movil',
            direccion: 'Izquierda',
            fecha: now,
        });
    }
    res.json({message: 'la Plataforma se Movio a la Izquierda'});
})

//Avanzar
router.get('/api/movimientos/avanzar', async (req, res) =>{
    for(let i = 0; i < 1; i++){
        await Movimientos.create({
            dispositivo: 'Movil',
            direccion: 'Avanzar',
            fecha: now,
        });
    }
    res.json({message: 'la Plataforma Avanzo'});
})

//Retroceder
router.get('/api/movimientos/retroceder', async (req, res) =>{
    for(let i = 0; i < 1; i++){
        await Movimientos.create({
            dispositivo: 'Movil',
            direccion: 'Retroceder',
            fecha: now,
        });
    }
    res.json({message: 'la Plataforma Retrocedio'});
})

module.exports = router;