import urlSchema from "../schemas/urlSchema.js";

export function urlValidate (request, response, next){
    const urlRegister = request.body;
    const validation = urlSchema.validate(urlRegister);
    if (validation.error){
        return response.status(422).send(validation.error.details);
    }
    next();
}