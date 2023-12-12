import { Invoice } from "../models/Invoice.js";
import { Appointment } from "../models/Appointment.js";
import { Product } from "../models/Product.js";

export const createInvoice = async (req, res) => {
  try {
    const { appointmentId, total_amount, payment_status, productos } = req.body;

    const appointment = await Appointment.findByPk(appointmentId);
    if (!appointment) {
      return res.status(404).json({ error: "Cita no encontrada" });
    }

    const newInvoice = await Invoice.create({
      appointmentId,
      total_amount,
      payment_status,
    });
    
    if (productos && productos.length > 0) {
      const products = await Product.findAll({
        where: {
          id: productos,
        },
      });

      await newInvoice.setProductos(products);
    }

    return res.status(201).json(newInvoice);
  } catch (error) {
    console.error("Error al crear la factura:", error);
    return res.status(500).json({ error: "Error interno del servidor" });
  }
};
