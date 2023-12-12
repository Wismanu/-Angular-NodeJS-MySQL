import { Router } from "express";
import {
  createUser,
  getUserById,
  getUsers,
  updateUserAddress,
} from "../controllers/user.controller.js";
import { veriryToken, isAdmin } from "../middlewares/authJwt.js";
import {
  checkRolesExisted,
  checkDuplicateUsernameOrEmail,
} from "../middlewares/verifySingup.js";

const router = Router();

router.post(
  "/",
  [veriryToken, isAdmin, checkRolesExisted, checkDuplicateUsernameOrEmail],
  createUser
);
router.get("/", [veriryToken, isAdmin], getUsers);
router.get("/:id", [veriryToken, isAdmin], getUserById);
router.put("/:id", [veriryToken, isAdmin], updateUserAddress);

export default router;
