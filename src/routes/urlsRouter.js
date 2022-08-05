import { Router } from "express";

import { urlValidate } from "../middlewares/urlMiddleware.js";
import { shortenURL, getURLid } from "../controllers/urlController.js";
import { validateToken } from "../middlewares/tokenMiddleware.js";

const urlRouter = Router();

urlRouter.post('/urls/shorten', urlValidate, validateToken, shortenURL);
urlRouter.get('/urls/:id', getURLid);

export default urlRouter;