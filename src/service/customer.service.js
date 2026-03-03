import { pool } from "../config/pgconfig.js";


export const getAllCustomers = async () => {
    let query = `SELECT * FROM daniel_gutierrez.customers`

    try {
        const response = await pool.query(query);
        return response;
    } catch (error) {
        console.error(`cannot obtain customers: ${error}`);
        throw (error);
    }
}


