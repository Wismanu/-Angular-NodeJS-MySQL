import { Appointment } from "../models/Appointment.js";
import { Service } from "../models/Service.js";
import { User } from "../models/User.js";

export const createAppointment = async (req, res) => {
  try {
    const { date_hour, client_id, beautician_id, service_id, state } = req.body;

    const client = await User.findByPk(client_id);
    const beautician = await User.findByPk(beautician_id);

    if (!client || !beautician) {
      return res
        .status(404)
        .json({ message: "El cliente o el estetisista no existe" });
    }

    const service = await Service.findByPk(service_id);

    if (!service) {
      return res.status(404).json({ message: "El servicio no existe" });
    }

    const newAppintment = await Appointment.create({
      date_hour,
      client_id,
      beautician_id,
      service_id,
      state,
    });

    return res
      .status(201)
      .json({ message: "Created appointment", newAppintment });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getAppointments = async (res, req) => {
  try {
    const appointments = await Appointment.findAll();
    res.status(200).json(appointments);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getAppointmentById = async (res, req) => {
  try {
    const id = req.params.id;

    const appointment = await Appointment.findByPk(id);

    if (!appointment) {
      return res.status(404).json({ message: "Appointment does not exist" });
    }
  } catch (error) {}
};

export const updateDateHourAppointment = async (req, res) => {
  try {
    const id = req.params.id;
    const { date_hour } = req.body;

    const appointment = await Appointment.findByPk(id);

    if (!appointment) {
      return res
        .status(404)
        .json({ message: `Appointment with id: ${id} does not exist` });
    }

    appointment.date_hour = date_hour;

    const appointmentUpdated = await appointment.save();

    res.json({
      message: "Date of appointment updated successfully",
      appointmentUpdated,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const updateStateAppointment = async (req, res) => {
  try {
    const id = req.params.id;
    const { state } = req.body;

    const appointment = await Appointment.findByPk(id);

    if (!appointment) {
      return res
        .status(404)
        .json({ message: `Appointment with id: ${id} does not exist` });
    }

    appointment.state = state;

    const appointmentUpdated = await appointment.save();

    res.json({
      message: "Date of appointment updated successfully",
      appointmentUpdated,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const deleteAppointment = async (req, res) => {
  try {
    const id = req.params.id;

    const appointment = await Appointment.findByPk(id);

    if (!appointment) {
      return res
        .status(404)
        .json({ message: `Appointment with id: ${id} does not exist` });
    }

    await Appointment.destroy({
      where: {
        id,
      },
    });

    res.json({ message: "Appointment deleted successfully", appointment })
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
