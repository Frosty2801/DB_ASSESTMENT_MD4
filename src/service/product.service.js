import { pool } from "../config/pgconfig.js";

export const getAllProducts = async (id_product) => {

    let query = `SELECT * FROM daniel_gutierrez.products WHERE id_product = $1`
    const values = [id_product]

    try {
        const response = await pool.query(query, values);
        return response.rows;
    } catch (error) {
        console.error(`cannot obtain products: ${error}`);
        throw error;
    }
}

export const createProduct = async (id_product, sku_product, name_product,  category_product, id_supplier) => {

    const query = `INSERT INTO daniel_gutierrez.products (id_product, sku_product, name_product, category_product, id_supplier) VALUES ($1, $2, $3, $4, $5) RETURNING id_product, sku_product, name_product, category_product, id_supplier`;
    const values = [id_product, sku_product, name_product, category_product, id_supplier]

    try {
        const response = await pool.query(query, values);

        if (!response.rows[0]) {
            throw Error("Cannot create product")
        }
        return response;

    } catch (error) {
        console.error(`cannot create product: ${error}`);
        throw (error);
    }

}
