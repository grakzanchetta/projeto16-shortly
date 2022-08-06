import joi from 'joi';

const loginSchema = joi.object({
    email: joi.string().max(75).email().required(),
    password: joi.string().min(8).max(20).required()
});

export default loginSchema;