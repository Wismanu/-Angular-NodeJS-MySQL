import { Router } from "express";

import {
  getProducts,
  createProduct,
  updateProduct,
  deleteProduct,
  getProductById,
} from "../controllers/products.controller.js";

import { veriryToken, isAdmin } from "../middlewares/authJwt.js";

const router = Router();

router.get("/", getProducts);
router.post("/", [veriryToken, isAdmin], createProduct);
router.put("/:id", [veriryToken, isAdmin], updateProduct);
router.delete("/:id", [veriryToken, isAdmin], deleteProduct);
router.get("/:id", getProductById);

export default router;
