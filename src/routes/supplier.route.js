import { Router } from "express";
import { getAll, create } from "../controllers/supplier.controller.js";

export const supplierRoutes = Router();

supplierRoutes.get('/', getAll);
supplierRoutes.post('/', create);


