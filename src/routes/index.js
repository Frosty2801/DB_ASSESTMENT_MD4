import { customerRoutes } from './customers.route.js';
import { supplierRoutes } from './supplier.route.js';
import { productRoutes } from './product.route.js';

export const routes = [
    { path: '/customers', router: customerRoutes },
    { path: '/suppliers', router: supplierRoutes },
    { path: '/products', router: productRoutes }
];
