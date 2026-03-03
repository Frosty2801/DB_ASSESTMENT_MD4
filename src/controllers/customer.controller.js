import { getAllCustomers } from "../service/customer.service.js";

export const getAll = async (req, res) => {

    try {
        const customers = await getAllCustomers()
        return res.status(200).json({response: customers.rows})
    } catch (error) {
        res.status(500).json({
            response: error
        });
    }
}