import database from "../databases/database.js";

export async function validateToken (request, response, next){
    
    const authorization = request.headers.authorization;
    const token = authorization?.replace("Bearer ", "");
    if (!token){
        return response.status(401).send('Token not Found');
    }
    try {
        const { rows: sessions } = await database.query(`SELECT * FROM sessions WHERE token = $1`, [token]);
        const [session] = sessions;
        if (!session){
            return response.status(401).send('Session not Found');
        }
        const { rows: users } = await database.query(`SELECT * FROM users WHERE id = $1`, [session.userId]);
        const [user] = users;
        if (!user){
            return response.status(401).send('User not Found');
        }
        response.locals.user = user;
        next();
    } catch (error) {
        return response.status(500).send(error.message);
    }

}