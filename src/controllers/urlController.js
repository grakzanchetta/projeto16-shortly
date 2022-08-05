import { nanoid } from "nanoid";
import database from "../databases/database.js";

export async function shortenURL (request, response){
    const { id } = response.locals.user;
    const { url } = request.body;
    const shortURL = nanoid(10)
    try {
        await database.query ('INSERT INTO urls (url, "shortUrl", id) VALUES ($1, $2, $3)', [url, shortURL, id]);
        response.status(201).send({shortURL})
    } catch (error) {
        response.status(500).send(error.message);
    }
}

export async function getURLid (request, response){
    const { id } = request.params;

    try {
        const result = await database.query(`SELECT * FROM urls WHERE id = $1`, [id]);
        if (result.rowCount === 0){
            return response.sendStatus(404)
        }
        const [url] = result.rows;
        delete url.visitCount;
        delete url.userId;
        delete url.createdAt;
        response.send(url)

    } catch (error) {
        
    }

}