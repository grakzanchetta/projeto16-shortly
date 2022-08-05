import joi from 'joi';

const loginSchema = joi.object({
    email: joi.string().max(75).email().required(),
    password: joi.string().max(20).required()
});

export default loginSchema;