import { Router } from "express";
import { getAll, create } from "../controllers/product.controller.js";

export const productRoutes = Router();

productRoutes.get('/', getAll);
productRoutes.post('/', create);

