import express from 'express';
import { routes } from './routes/index.js';

const app = express();

app.use(express.json());

app.use(express.urlencoded({ extended: true }));

// Debug temporal
app.use((req, res, next) => {
    console.log('Content-Type:', req.headers['content-type']);
    console.log('Body:', req.body);
    next();
});

// Registrar todas las rutas
routes.forEach(({ path, router }) => {
    app.use(path, router);
});


export default app;