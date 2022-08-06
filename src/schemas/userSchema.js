import joi from 'joi';

const userSchema = joi.object({
    name: joi.string().max(50).required(),
    email: joi.string().max(75).email().required(),
    password: joi.string().min(8).max(20).required(),
    confirmPassword: joi.ref("password"),
});

export default userSchema;