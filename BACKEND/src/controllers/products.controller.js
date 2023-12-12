import { Product } from "../models/Product.js";

export const createProduct = async (req, res) => {
  try {
    const { name, description, price, img_url } = req.body;

    const productCreated = await Product.create({
      name,
      description,
      price,
      img_url,
    });

    res.status(201).json({ message: "Created product", productCreated });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getProducts = async (req, res) => {
  try {
    const products = await Product.findAll();
    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getProductById = async (req, res) => {
  try {
    const id = req.params.id;

    const product = await Product.findByPk(id);

    if (!product)
      return res.status(404).json({
        message: `Product with id: ${id} does not exist`,
      });

    res.json({ product });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const updateProduct = async (req, res) => {
  try {
    const id = req.params.id;
    const { name, description, price, img_url } = req.body;

    const product = await Product.findByPk(id);

    if (!product)
      return res.status(404).json({
        message: `Product with id: ${id} does not exist`,
      });

    product.name = name;
    product.description = description
    product.price = price;
    product.img_url = img_url;

    const productUpdated = await product.save();

    res.json({ message: "Product updated successfully", productUpdated });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const deleteProduct = async (req, res) => {
  try {
    const id = req.params.id;

    const product = await Product.findByPk(id);

    if (!product)
      return res.status(404).json({
        message: `Product with id: ${id} does not exist`,
      });

    await Product.destroy({
      where: {
        id,
      },
    });

    res.json({ message: "Product deleted successfully", product });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
