import bcrypt from 'bcryptjs';
import { Usuario } from '../models/usuario.model.js';

export const authenticateUser = async ({ username, password }) => {
    const user = await Usuario.findOne({ where: { username } });

    if (!user) {
        return null;
    }

    const isValidPassword = await bcrypt.compare(password, user.password);
    if (!isValidPassword) {
        return null;
    }

    return {
        id: user.id,
        username: user.username,
        nombre: user.nombre,
        rol: user.rol,
    };
};

export const createUser = async ({ username, nombre, password, rol }) => {
    const user = await Usuario.create({ username, nombre, password, rol });

    return {
        id: user.id,
        username: user.username,
        nombre: user.nombre,
        rol: user.rol,
    };
};