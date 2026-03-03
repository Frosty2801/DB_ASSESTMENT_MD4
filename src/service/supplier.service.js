import { pool } from "../config/pgconfig.js";

export const getAllSuppliers = async (id_supplier) => {

    let query = `SELECT * FROM daniel_gutierrez.suppliers WHERE id_supplier = $1`
    const values = [id_supplier]

    try {
        const response = await pool.query(query, values);
        return response.rows;
    } catch (error) {
        console.error(`cannot obtain suppliers: ${error}`);
        throw error;
    }

}

export const createSupplier = async (id_supplier, name_supplier, email_supplier) => {

    const query = `INSERT INTO daniel_gutierrez.suppliers (id_supplier, name_supplier, email_supplier) VALUES ($1, $2, $3) RETURNING id_supplier, name_supplier, email_supplier`;
    const values = [id_supplier, name_supplier, email_supplier]

    try {
        const response = await pool.query(query, values);

        if (!response.rows[0]) {
            throw Error("Cannot create supplier")
        }
        return response;

    } catch (error) {
        console.error(`cannot create supplier: ${error}`);
        throw (error);
    }

}


