import bcrypt from "bcrypt";
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