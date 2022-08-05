import { Router } from 'express';
import userRouter from './userRouter.js';
import urlsRouter from './urlsRouter.js';

const router = Router();

router.use(userRouter);
router.use(urlsRouter);

export default router;