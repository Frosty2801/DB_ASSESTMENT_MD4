import { Router } from "express";
import { getAll } from "../controllers/customer.controller.js";

export const customerRoutes = Router();

customerRoutes.get('/', getAll);