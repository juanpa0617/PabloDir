import express from 'express';
import dbconnection from '../database/config.db.js';
import 'dotenv/config';
import morgan from 'morgan';
import routerAmenities from '../Routes/Amenities.js';
import routerUsers from '../Routes/User.js';
import cors from 'cors';

class Server {
    constructor() {
        this.app = express();
        this.app.use(express.json());
        this.app.use(morgan('dev'));
        this.app.use(cors());
        this.dbconnection();
        this.routes();
        this.listen();
    }

    async dbconnection() {
        try {
            await dbconnection();
            console.log('Database connected');
        } catch (error) {
            console.error('Error connecting to database:', error);
        }
    }

    routes() {
        this.app.use('/api', routerAmenities);
        this.app.use('/api', routerUsers);
    }

    listen() {
        this.app.listen(process.env.PORT, () => {
            console.log(`Server is running on port ${process.env.PORT}`);
        });
    }
}

export default Server;