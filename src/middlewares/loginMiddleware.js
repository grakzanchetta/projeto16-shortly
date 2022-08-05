import loginSchema from "../schemas/loginSchema.js";

export function loginValidate (request, response, next){
    const loginRegister = request.body;
    const validation = loginSchema.validate(loginRegister);
    if (validation.error){
        return response.status(422).send(validation.error.details);
    }
    next();
}