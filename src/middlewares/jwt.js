import jwt from 'jsonwebtoken'; 

const cookieName = 'token';
const tokenLifetime = 60 * 60;

export const issueToken = (res, { username, rol }) => {
    const token = jwt.sign({ username, rol }, process.env.SECRET_KEY, {
        algorithm: 'HS256',
        expiresIn: tokenLifetime,
    });

    res.cookie(cookieName, token, {
        httpOnly: true,
        path: '/',
        secure: process.env.NODE_ENV === 'production',
        sameSite: 'strict',
        maxAge: tokenLifetime * 1000,
    });
};

export const verifyToken = (req, res, next) => {
    // En este proyecto esperamos una sola cookie con el formato "token=eyJ...".
    const cookie = req.headers.cookie?.trim() ?? '';
    const prefix = `${cookieName}=`;

    if (!cookie.startsWith(prefix) || cookie.length === prefix.length) {
        return res.status(401).json({ message: 'Se requiere iniciar sesión.' });
    }

    const token = cookie.slice(prefix.length);

    try {
        req.user = jwt.verify(token, process.env.SECRET_KEY, { algorithms: ['HS256'] });
    } catch {
        return res.status(401).json({ message: 'Token inválido o vencido.' });
    }

    return next();
};
