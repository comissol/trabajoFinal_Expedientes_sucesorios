import { getAllUsuarios } from '../services/usuario.service.js';

export const verUsuario = async (req, res) => {
    const usuarios = await getAllUsuarios();
    return res.status(200).json(usuarios);
};