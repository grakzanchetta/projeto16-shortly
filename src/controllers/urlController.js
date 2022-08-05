import { nanoid } from "nanoid";
import database from "../databases/database.js";

export async function shortenURL (request, response){
    const {id} = response.locals.user;
    const {url} = request.body;
    const shortURL = nanoid(6)
    try {
        await database.query ('INSERT INTO urls (url, "shortUrl", id) VALUES ($1, $2, $3)', [url, shortURL, id]);
        response.status(201).send({shortURL})
    } catch (error) {
        response.status(500).send(error.message);
    }
}