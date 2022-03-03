const { Router } = require('express');
const router = Router();

const casual  = require('casual');

const User = require('../models/User');


router.get('/api/users', async (req, res) =>{
    const users = await User.find();
    res.json({users});
});

router.get('/api/users/create', async (req, res) =>{
    for(let i = 0; i < 1; i++){
        await User.create({
            firtsName: casual.first_name,
            lastName: casual.last_name,
            avatar: 'https://i.pinimg.com/474x/3d/25/de/3d25de7140d344beefb78c3f04177921.jpg'
        });
    }
    res.json({message: '5 Users created'});
})

module.exports = router;