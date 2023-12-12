import { User } from "../models/User.js";
import { Role } from "../models/Role.js";

import jwt from "jsonwebtoken";
import config from "../config.js";

export const createUser = async (req, res) => {
  try {
    const { name, lastName, document,date, email, password, address,gender,role } = req.body;
    const newUser = new User();

    let userRole;
    if (role) {
      const roles = await Role.findAll({
        where: { name: role },
      });
      userRole = roles.map((role) => role.name);
    } else {
      const defaultRole = await Role.findOne({
        where: { name: "cliente" },
      });
      userRole = [defaultRole.name];
    }

    const regex = /^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (!regex.test(email)) {
      return res.status(403).json({ message: "It's Not an Email!" })
    }

    if (name.length==0) {
      console.log("error 1");
      return res.status(403).json({ message:"name so short or empty field! min length 2" })
    }

    if (lastName.length<3) {
      console.log("error 2");
      return res.status(403).json({ message:"lastnName so short or empty field!  min length 2" })
    }

    if (document.length<10) {
      console.log("error 3");
      return res.status(403).json({ message: "document too short, min length 10!" })
    }

    if (password.length<7) {
      console.log("error 4");
      return res.status(403).json({ message: "password too short, min length 8!" })
    }

    if(address.length<2){
      console.log("error 5");
      return res.status(403).json({ message: "Address are null!" })
    }

    const userRegistered = await User.create({
      name,
      lastName, 
      document,
      date, 
      email, 
      password: await newUser.encryptPassword(password) ,
      address,
      gender,
      role 
    });

    const token = jwt.sign({ id: userRegistered.id }, config.SECRET, {
      expiresIn: 86400,
    });

    res.status(200).json({ token });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getUsers = async (req, res) => {
  try {
    const users = await User.findAll();
    res.status(200).json(users);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const getUserById = async (req, res) => {
  try {
    const id = req.params.id;

    const user = await User.findByPk(id);

    if (!user) {
      return res.status(200).json({
        message: `User with id: ${id} does not exist`,
      });
    }

    res.json({ user });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const updateUserAddress = async (req, res) => {
  try {
    const id = req.params.id;
    const {address} = req.body;

    const user = await User.findByPk(id);

    if(!user) {
      return res.status(404).json({
        message: `User with id: ${id} does not exist`,
      });
    }

    user.address = address;

    const userUpdated = await user.save();

    res.json({message: "User updated successfully", userUpdated});
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}