import { Router } from "express";

import { createInvoice } from "../controllers/invoice.controller.js";

const router = Router();

router.post("/", createInvoice);

export default router;