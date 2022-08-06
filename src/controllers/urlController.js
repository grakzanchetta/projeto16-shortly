import { nanoid } from "nanoid";
import database from "../databases/database.js";

export async function shortenURL (request, response){
    const { id } = response.locals.user;
    const { url } = request.body;
    const shortURL = nanoid(10)
    try {
        await database.query ('INSERT INTO urls (url, "shortUrl", "userId") VALUES ($1, $2, $3)', [url, shortURL, id]);
        response.status(201).send({shortURL})
    } catch (error) {
        response.status(500).send(error.message);
    }
}

export async function getURLid (request, response){
    const { id } = request.params;

    try {
        const result = await database.query(`SELECT id, "shortUrl", url FROM urls WHERE id = $1`, [id]);
        if (result.rowCount === 0){
            return response.sendStatus(404)
        }
        const [url] = result.rows;
        response.send(url)

    } catch (error) {
        response.status(500).send(error.message);
    }
}

export async function openShortUrl (request, response){
    const { shortUrl } = request.params;
    try {
        const result = await database.query('SELECT * FROM urls WHERE "shortUrl" = $1', [shortUrl]);
        if (result.rowCount === 0){
            return response.sendStatus(404);
        }
        const [url] = result.rows;
        await database.query('UPDATE urls SET "visitCount" = "visitCount" + 1 WHERE "shortUrl" = $1', [url.shortUrl]);
        response.redirect(url.url);
    } catch (error) {
        return response.status(500).send(error.message);
    }
}

export async function deleteURL (request, response){
    const { id } = request.params;
    const { user } = response.locals;

    try {
        const result = await database.query(`SELECT * FROM urls WHERE id = $1`, [id]);
        if (result.rowCount === 0){
            return response.sendStatus(404)
        }
    const [url] = result.rows;
    if (url.userId !== user.id){
        return response.sendStatus(401);
    }
    await database.query('DELETE FROM urls WHERE id=$1', [id]);
    response.sendStatus(204);
    } catch (error) {
        return response.status(500).send(error.message);
    }
}