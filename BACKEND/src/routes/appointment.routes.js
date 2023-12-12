import { Router } from "express";

import {
    createAppointment,
    getAppointments,
    getAppointmentById,
    updateDateHourAppointment,
    updateStateAppointment,
    deleteAppointment
} from "../controllers/appointment.controller.js";

const router = Router();

router.get("/", getAppointments);
router.get("/:id", getAppointmentById);
router.post("/", createAppointment);
router.put("/dateHour/:id", updateDateHourAppointment);
router.put("/state/:id", updateStateAppointment);
router.delete("/:id", deleteAppointment);

export default router;