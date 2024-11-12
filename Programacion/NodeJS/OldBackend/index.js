import app from './src/app.js';
import { connectDB } from './src/db.js';

// Conectar a la base de datos
connectDB();
app.listen(3001, () => {
    console.log('Server running on port 3000');
});
