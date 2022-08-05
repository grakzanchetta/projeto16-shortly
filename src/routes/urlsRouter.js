import { Router } from "express";

import { urlValidate } from "../middlewares/urlMiddleware.js";
import { shortenURL } from "../controllers/urlController.js";
import { validateToken } from "../middlewares/tokenMiddleware.js";

const urlRouter = Router();

urlRouter.post('/urls/shorten', urlValidate, validateToken, shortenURL);

export default urlRouter;