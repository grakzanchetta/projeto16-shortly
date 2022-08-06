import bcrypt from "bcrypt";
import { v4 as uuid } from 'uuid';
import database from '../databases/database.js';

export async function createUser (request, response){
    const { name, email, password } = request.body;
    try {
        const emailExists = await database.query('SELECT id FROM users WHERE email=$1', [email]);
        if(emailExists.rowCount > 0){
            return response.sendStatus(409);
        }
        const SALT = 10;
        const passwordHash = bcrypt.hashSync(password, SALT);
        await database.query('INSERT INTO  users(name, email, password) VALUES ($1, $2, $3)', [name, email, passwordHash]);
        response.sendStatus(201);
    } catch (error) {
        response.status(500).send(error.message);
    }
}

export async function loginUser (request, response){
    const { email, password } = request.body;
    try {
        const { rows: users }  = await database.query('SELECT * FROM users WHERE email=$1', [email]);
        const [user] = users;
        if (!user){
            return response.sendStatus(401)
        }
        if (bcrypt.compareSync(password, user.password)) {
            const token = uuid();
            await database.query(`INSERT INTO sessions (token, "userId") VALUES ($1, $2)`, [token, user.id]);
            return response.send(token);
        }
    } catch (error) {
        response.status(500).send(error.message);
    }
}

