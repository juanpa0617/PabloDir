import express, { json } from 'express';
import dbconnection from '../database/config.js';
import 'dotenv/config';
import routerUser from '../routes/userRoute.js';
import routerLogin from '../routes/loginRoute.js';

export default class Server {
    constructor() {
        this.app = express();
        this.app.use(json())
        this.routes();
        this.dbconnection();
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

    middlewares() {
        this.app.use(json());
    }

    routes() {
        this.app.use('/api/User', routerUser);
        this.app.use('/api/login', routerLogin);

    }

    listen() {
        this.app.listen(process.env.PORT, () => {
            console.log(`Server is running on port ${process.env.PORT}`);
        });
    }
}
