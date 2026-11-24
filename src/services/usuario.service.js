import { Usuario } from '../models/usuario.model.js';

export const getAllUsuarios = async () => {
    return await Usuario.findAll(
        { attributes: { exclude: ['password'] } } // excluí contraseña
    );
};