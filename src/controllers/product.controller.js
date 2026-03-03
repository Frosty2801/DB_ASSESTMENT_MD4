import { getAllProducts, createProduct } from "../service/product.service.js";

export const getAll = async (req, res) => {

    try {
        const products = await getAllProducts()
        return res.status(200).json({response: products.rows})
    } catch (error) {
        res.status(500).json({
            response: error
        });
    }
}

export const create = async (req, res) => {

    const { id_product, sku_product, name_product,  category_product, id_supplier} = req.body;

    try {
        const newProduct = await createProduct(id_product, sku_product, name_product, category_product, id_supplier)
        return res.status(201).json({response: newProduct.rows[0]})
    } catch (error) {
        res.status(500).json({
            response: error
        });
    }
}
