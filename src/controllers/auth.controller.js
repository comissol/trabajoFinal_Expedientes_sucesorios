import { issueToken } from '../middlewares/jwt.js';
import { authenticateUser, createUser } from '../services/auth.service.js';

export const login = async (req, res, next) => {
    try {
        const { username, password } = req.body;
        const authenticatedUser = await authenticateUser({ username, password });

        if (!authenticatedUser) {
            return res.status(401).json({ message: 'Credenciales inválidas.' });
        }

        const session = {
            username: authenticatedUser.username,
            rol: authenticatedUser.rol,
        };

        issueToken(res, session);
        return res.status(200).json(session);
    } catch (err) {
        return next(err);
    }
};

export const register = async (req, res, next) => {
    try {
        const { username, nombre, password, rol } = req.body;
        const createdUser = await createUser({ username, nombre, password, rol });
        return res.status(201).json(createdUser);
    } catch (err) {
    if (err.code === "USERNAME_EXISTS") {
        return res.status(409).json({
            message: err.message || "El nombre de usuario ya existe." });
    }
        return next(err);
    }
};