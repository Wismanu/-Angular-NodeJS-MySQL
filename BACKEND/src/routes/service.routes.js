import { Router } from "express";

import {
  createService,
  getServices,
  getServiceById,
  updateService,
  deleteService,
} from "../controllers/service.controller.js";

import { isAdmin } from "../middlewares/authJwt.js";

const router = Router();

router.get("/", getServices);
router.post("/", [isAdmin], createService);
router.put("/:id", [isAdmin], updateService);
router.delete("/:id", [isAdmin], deleteService);
router.get("/:id", getServiceById);

export default router;