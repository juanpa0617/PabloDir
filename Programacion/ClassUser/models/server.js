const express = require('express');
const dbConnection = require('../config/db');
require('dotenv').config();


class Server{
    constructor(){
        this.app = express();
        this.port = process.env.PORT;
        this.usersPath = '/api/users';

        //Conectar DB
        this.conectarDB();

    }

    async conectarDB(){
        await dbConnection();
    }

    
}