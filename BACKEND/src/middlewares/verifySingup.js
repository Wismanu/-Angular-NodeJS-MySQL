import { ROLES } from "../models/Role.js";
import { User } from "../models/User.js";

export const checkDuplicateUsernameOrEmail = async (req, res, next) => {
  try {
    const user = await User.findOne({
      where: {
        document: req.body.document,
      },
    });
    if (user)
      return res.status(400).json({ message: "The document already exists" });

    const email = await User.findOne({
      where: {
        email: req.body.email,
      },
    });
    if (email)
      return res.status(400).json({ message: "The email already exists" });

    next();
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

export const checkRolesExisted = (req, res, next) => {
  if (req.body.role) {
    for (let i = 0; i < req.body.role.length; i++) {
      if (!ROLES.includes(req.body.role[i])) {
        return res.status(400).json({
          message: `Role ${req.body.role[i]} does not exists`,
        });
      }
    }
  }

  next();
};
