import { Service } from "../models/Service.js";

export const createService = async (req, res) => {
  try {
    const { name, description, price } = req.body;

    const serviceCreated = await Service.create({
      name,
      description,
      price,
    });

    res.status(201).json({ message: "Created service", serviceCreated });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getServices = async (req, res) => {
  try {
    const services = await Service.findAll();
    res.status(200).json(services);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getServiceById = async (req, res) => {
  try {
    const id = req.params.id;

    const service = await Service.findByPk(id);

    if (!service)
      return res.status(404).json({
        message: `Service with id: ${id} does not exist`,
      });

    res.json({ service });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const updateService = async (req, res) => {
  try {
    const id = req.params.id;
    const { name, description, price } = req.body;

    const service = await Service.findByPk();

    if (!service) {
      return res.status(404).json({
        message: `Service with id: ${id} does not exist`,
      });
    }

    service.name = name;
    service.description = description;
    service.price = price;

    const serviceUpdated = await service.save();

    res.json({ message: "Service updated successfull", serviceUpdated });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const deleteService = async (req, res) => {
  try {
    const id = req.params.id;

    const service = await Service.findByPk(id);

    if (!service)
      return res.status(404).json({
        message: `Service with id: ${id} does not exist`,
      });

    await Service.destroy({
      where: {
        id,
      },
    });

    res.json({ message: "Service deleted successfully", service });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
