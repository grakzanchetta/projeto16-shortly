import userSchema from "../schemas/userSchema.js";

export function userValidate (request, response, next){
    const userRegister = request.body;
    const validation = userSchema.validate(userRegister);
    if (validation.error){
        return response.status(422).send(validation.error.details);
    }
    next();
}