import { Router } from "express";

import { userValidate } from "../middlewares/userMiddleware.js";
import { loginValidate } from "../middlewares/loginMiddleware.js";
import { createUser, getMyUser, loginUser } from "../controllers/userController.js";
import { validateToken } from "../middlewares/tokenMiddleware.js";

const userRouter = Router();

userRouter.post('/signup', userValidate, createUser);
userRouter.post('/signin', loginValidate, loginUser);
userRouter.get('/users/me', validateToken, getMyUser);

export default userRouter;