# Expedientes Sucesorios - Backend API

API REST para gestión de expedientes sucesorios con autenticación JWT, control de roles y validación de datos.

## 🚀 Instalación y Ejecución

### Requisitos
- Node.js 18+
- MySQL 8.0+

### Pasos

1. **Configurar variables de entorno**
   ```bash
   cp .env.example .env
   # Editar .env con credenciales MySQL
   ```

2. **Instalar dependencias**
   ```bash
   npm install
   ```

3. **Ejecutar el servidor**
   ```bash
   # Desarrollo (con reinicio automático)
   npm run dev
   
   # Producción
   node src/server.js
   ```

El servidor se ejecutará en `http://localhost:3000`

## 📖 Documentación API

La documentación completa de endpoints, campos y validaciones está en:
- **[src/docs/DOCUMENTACION_API.md](src/docs/DOCUMENTACION_API.md)**

### 🧪 Probar con Swagger UI

Una vez que el servidor está corriendo:

```
http://localhost:3000/api-docs
```

Interfaz interactiva para probar todos los endpoints sin necesidad de curl.

## ⚙️ Configuración

Archivo `.env` (basado en `.env.example`):

```env
DB_NAME=estudio_sucesiones
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_HOST=localhost
DB_PORT=3306
SECRET_KEY=tu_clave_secreta_jwt
```

## 📋 Endpoints Principales

| Método | Ruta | Autenticación | Descripción |
|--------|------|---------------|------------|
| POST | `/auth/register` | No | Registrar usuario |
| POST | `/auth/login` | No | Iniciar sesión |
| GET | `/expedientes` | Sí | Listar expedientes |
| GET | `/expedientes/buscar/{termino}` | Sí | Buscar expedientes |
| POST | `/expedientes` | Sí | Crear expediente |
| PATCH | `/expedientes/{id}` | Sí | Actualizar expediente |
| DELETE | `/expedientes/{id}` | Sí | Eliminar expediente |

Ver [src/docs/DOCUMENTACION_API.md](src/docs/DOCUMENTACION_API.md) para todos los endpoints.

## ⚠️ Decisiones de Diseño

### Registro Público (Decisión para Fines Educativos)

El endpoint `POST /auth/register` **es público y abierto**.

**Comportamiento:**
- Cualquiera puede crear usuario con: `username`, `nombre` y `password`
- El **rol siempre se asigna automáticamente como "Pasante"**
- Si se envía un campo `rol` en el request, se rechaza con error 400
- No se requiere confirmación por email

**Contexto:**
- En un sistema real, el registro estaría restringido solo a Administradores
- Un Pasante puede consultar todos los expedientes (con datos personales), lo que requiere control de acceso más estricto

---

### Sin Verificación de Correo Electrónico

Este sistema **no incluye flujo de confirmación por correo** ni almacena email de usuarios.

**Razones:**

1. **Usuarios internos y controlados:** Sistema orientado a un equipo de trabajo conocido (abogados, paralegales, administración), no a registro masivo en internet

2. **Controles alternativos más efectivos:**
   - Validaciones estrictas de entrada (Zod)
   - Rate limiting en autenticación (5 intentos/15min)
   - Trazabilidad de auditoría (`creadoPor` / `modificadoPor`)
   - Control de acceso y baja de cuentas

3. **Modelo de datos ajustado:** No almacenar emails evita complejidad innecesaria

**Reconsiderar si:**
- Se habilita acceso de clientes externos
- Se implementa recuperación autónoma de contraseña
- El modelo de registro cambia hacia esquema más abierto

---

## 🔐 Autenticación

- **Usuario**: 3-50 caracteres, solo letras y números
- **Contraseña**: 8-72 caracteres, letras + números + @ + *
- **Token**: Se envía en cookies
- **Roles**: Pasante, Secretaria, Administrador

### Campos Automáticos

Los campos `creadoPor` y `modificadoPor` **se asignan automáticamente** desde `req.user.username`. **No deben incluirse en el request**:
- En POST: se asigna `creadoPor` del usuario autenticado
- En PATCH: se asigna `modificadoPor` del usuario autenticado

## 📂 Estructura

```
src/
├── app.js              # Configuración de Express
├── server.js           # Entry point
├── config/             # Configuración de BD
├── controllers/        # Lógica de endpoints
├── services/           # Lógica de negocio
├── models/             # Modelos Sequelize
├── schemas/            # Validaciones Zod
├── routes/             # Definición de rutas
├── middlewares/        # Auth, validación, rate limiting
└── docs/               # Documentación
```