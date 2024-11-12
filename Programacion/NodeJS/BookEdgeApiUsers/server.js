const express = require('express');
const app = express();
const port = 3000;
require('./database/config');
const User = require('./Schema/users'); 

app.use(express.json());

app.get('/api/users', async (req, res) => {
    try {
        const users = await User.find(); 
        res.json(users);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

app.post('/api/users', async (req, res) => {
    const body = req.body;
    let msg = "User created successfully";
    try {
        const user = new User(body); 
        await user.save();
        res.status(201).json({ message: msg, user });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

app.put('/api/users/:id', async (req, res) => {
    const id = req.params.id;
    const body = req.body;
    let msg = "User updated successfully"; // Corrección en la declaración de la variable
    try {
        const user = await User.findByIdAndUpdate(id, body, { new: true }); 
        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }
        res.status(201).json({ message: msg, user });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

app.delete('/api/users/:id', async (req, res) => {
    const id = req.params.id;
    let msg = "User deleted successfully"; // Corrección en la declaración de la variable
    try {
        const user = await User.findByIdAndDelete(id); // Cambiado a 'User'
        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }
        res.status(201).json({ message: msg });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

app.listen(port, () => {
    console.log(`Example app listening on port http://localhost:${port}`);
});
