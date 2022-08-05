import cors from 'cors';
import dotenv from 'dotenv';
import express from 'express';
import router from './routes/indexRouter.js';

dotenv.config();
const server = express();

server.use(cors());
server.use(express.json());
server.use(router)

server.listen(process.env.PORT, () => {
    console.log(`Server Running Up That Hill on PORT ${process.env.PORT}`)
})