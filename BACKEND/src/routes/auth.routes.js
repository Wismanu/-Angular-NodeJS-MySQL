import { Router } from "express";
const router = Router();

import { logout, signIn, signUp } from "../controllers/auth.controller.js";
import {
  checkRolesExisted,
  checkDuplicateUsernameOrEmail,
} from "../middlewares/verifySingup.js";

router.post(
  "/signup",
  [checkDuplicateUsernameOrEmail, checkRolesExisted],
  signUp
);
router.post("/signin", signIn);
router.post("/logout", logout);

export default router;
