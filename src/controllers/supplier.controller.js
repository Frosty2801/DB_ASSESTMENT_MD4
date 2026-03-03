import { getAllSuppliers, createSupplier } from "../service/supplier.service.js";


export const getAll = async (req, res) => {

    const { id_supplier } = req.query;

    try {
        const suppliers = await getAllSuppliers(id_supplier);
        res.status(200).json({ response: suppliers });
    } catch (error) {
        console.error('Error cant obtain suppliers:', error);
        res.status(500).json({ error: error.message });
    }

};

export const create = async (req, res) => {

    const { id_supplier, name_supplier, email_supplier } = req.body;

    try {
        const newPatient = await createSupplier(id_supplier, name_supplier, email_supplier);
        return res.status(201).json({
            response: "Supplier created"
        })
    } catch (error) {
        res.status(500).json({
            response: error
        });
    }

}