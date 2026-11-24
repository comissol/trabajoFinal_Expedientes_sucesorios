export function notFound(req, res) {
  res.status(404).json({ error: 'Ruta no encontrada' });
}

export function errorHandler(err, req, res, next) {
  // body-parser no debe exponer el detalle del parser al cliente.
  if (err.type === 'entity.parse.failed') {
    return res.status(400).json({ error: 'JSON inválido' });
  }
  const status = err.status ?? 500;
  if (status >= 500) {
    console.error(err);
  }
  res.status(status).json({
    error: status >= 500 ? 'Error interno del servidor' : err.message,
  });
}
