import { Router } from "express";

import { userValidate } from "../middlewares/userMiddleware.js";
import { loginValidate } from "../middlewares/loginMiddleware.js";
import { createUser, loginUser } from "../controllers/userController.js";

const userRouter = Router();

userRouter.post('/signup', userValidate, createUser);
userRouter.post('/signin', loginValidate, loginUser);

export default userRouter;