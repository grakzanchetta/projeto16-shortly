import { Router } from "express";

import { userValidate } from "../middlewares/userMiddleware.js";
import { createUser } from "../controllers/userController.js";

const userRouter = Router();

userRouter.post('/signup', userValidate, createUser);

export default userRouter;