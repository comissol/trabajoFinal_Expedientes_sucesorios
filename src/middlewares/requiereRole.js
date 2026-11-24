
export const requireRole = (...rol) => (req, res, next) => {
    if (!rol.includes(req.user.rol)) {
        return res.status(403).json({ message: 'No tenés permiso para realizar esta acción.' });
    }
    return next();
};