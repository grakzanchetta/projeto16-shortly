import { Router } from "express";

import { urlValidate } from "../middlewares/urlMiddleware.js";
import { shortenURL, getURLid, openShortUrl, deleteURL } from "../controllers/urlController.js";
import { validateToken } from "../middlewares/tokenMiddleware.js";

const urlRouter = Router();

urlRouter.post('/urls/shorten', urlValidate, validateToken, shortenURL);
urlRouter.get('/urls/:id', getURLid);
urlRouter.get('/urls/open/:shortUrl', openShortUrl);
urlRouter.delete('/urls/:id', validateToken, deleteURL);

export default urlRouter;