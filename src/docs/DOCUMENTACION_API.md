# 📖 DOCUMENTACIÓN DE API - Expedientes Sucesorios

Documentación completa de endpoints basada en el código actual del proyecto.

## 🔐 Autenticación

### Variables Importantes
- **Username**: Campo de usuario (3-50 caracteres, solo letras y números)
- **Password**: Contraseña (8-72 caracteres, letras, números, @, *)
- **Nombre**: Nombre completo del usuario (hasta 100 caracteres)
- **Rol**: Solo Pasante (por defecto en registro), Secretaria, Administrador (asignado manualmente)

---

## 📡 ENDPOINTS

### 1. POST /auth/register
**Registrar nuevo usuario**

**Requerimientos:**
- Autenticación: NO requerida
- Cualquiera puede registrarse como Pasante

**Body (application/json):**
```json
{
  "nombre": "Juan Pérez",
  "username": "juanperez",
  "password": "MiPassword123@"
}
```

**Validaciones:**
- `nombre`: Requerido, máximo 100 caracteres
- `username`: Requerido, 3-50 caracteres, solo letras y números (sin espacios, sin caracteres especiales)
- `password`: Requerido, mínimo 8 caracteres, máximo 72, solo letras, números, @ y *
- `rol`: NO enviable por cliente (siempre será Pasante)

**Respuesta 201 (Exitoso):**
```json
{
  "id": 1,
  "nombre": "Juan Pérez",
  "username": "juanperez",
  "rol": "Pasante",
  "activo": true,
  "createdAt": "2026-01-23T10:30:00.000Z",
  "updatedAt": "2026-01-23T10:30:00.000Z"
}
```

**Respuesta 400 (Error):**
```json
{
  "message": "username admite solo letras y números",
  "status": 400
}
```

---

### 2. POST /auth/login
**Autenticar usuario y obtener token JWT**

**Requerimientos:**
- Autenticación: NO requerida

**Body (application/json):**
```json
{
  "username": "juanperez",
  "password": "MiPassword123@"
}
```

**Validaciones:**
- `username`: Requerido, máximo 50 caracteres
- `password`: Requerido, máximo 72 caracteres

**Respuesta 200 (Exitoso):**
```json
{
  "username": "juanperez",
  "rol": "Secretaria"
}
```
⚠️ El token JWT se envía en la cookie de sesión automáticamente.

**Respuesta 401 (Credenciales inválidas):**
```json
{
  "message": "Credenciales inválidas.",
  "status": 401
}
```

**Rate Limiting:** 5 intentos por 15 minutos

---

### 3. GET /expedientes
**Listar expedientes**

**Requerimientos:**
- Autenticación: ✅ **Requerida** (cualquier rol)
- Cookie JWT requerida en headers

**Parámetros de Query:**
- `numeroExpediente` (opcional, integer): Filtrar por número de expediente

**Ejemplo de solicitud:**
```
GET http://localhost:3000/api/expedientes?numeroExpediente=120
Cookie: [JWT_TOKEN]
```

**Respuesta 200 (Exitoso):**
```json
[
  {
    "id": 1,
    "caratula": "Juan Pérez s/sucesión",
    "tipoProceso": "Sucesión",
    "numeroExpediente": 120,
    "juzgadoId": 1,
    "observaciones": "Expediente de sucesión con un heredero",
    "etapa": "Iniciado",
    "createdAt": "2026-01-15T10:30:00.000Z",
    "updatedAt": "2026-01-15T10:30:00.000Z"
  }
]
```

---

### 4. GET /expedientes/buscar/{busqueda}
**Buscar expedientes por término**

**Requerimientos:**
- Autenticación: ✅ **Requerida** (cualquier rol)

**Parámetros de Path:**
- `busqueda` (string, máximo 100 caracteres): Término de búsqueda

**Ejemplo:**
```
GET http://localhost:3000/api/expedientes/buscar/Perez
Cookie: [JWT_TOKEN]
```

**Respuesta 200:** Array de expedientes que coinciden con la búsqueda (mismo formato que GET /expedientes)

---

### 5. POST /expedientes
**Crear nuevo expediente**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Secretaria, Administrador

**Body (application/json):**
```json
{
  "caratula": "Juan Pérez s/sucesión",
  "tipoProceso": "Sucesión",
  "numeroExpediente": 120,
  "juzgadoId": 1,
  "observaciones": "Expediente de sucesión con herederos múltiples",
  "etapa": "Iniciado"
}
```

**Validaciones:**
- `caratula`: Requerido, máximo 200 caracteres
- `tipoProceso`: Requerido (valores válidos según tu sistema)
- `numeroExpediente`: Requerido, integer
- `juzgadoId`: Requerido, integer (ID del juzgado)
- `observaciones`: Opcional, máximo 5000 caracteres
- `etapa`: Por defecto "Iniciado", debe ser este valor para expedientes nuevos
- `creadoPor`: **Se asigna automáticamente** desde `req.user.username`
- `causante`: Opcional, objeto con nombreCompleto y dni

**Respuesta 201 (Exitoso):**
```json
{
  "id": 2,
  "caratula": "Juan Pérez s/sucesión",
  "tipoProceso": "Sucesión",
  "numeroExpediente": 120,
  "juzgadoId": 1,
  "observaciones": "Expediente de sucesión con herederos múltiples",
  "etapa": "Iniciado",
  "creadoPor": "juanperez",
  "createdAt": "2026-01-23T10:30:00.000Z",
  "updatedAt": "2026-01-23T10:30:00.000Z"
}
```

**Respuesta 403 (Acceso denegado):**
```json
{
  "message": "No tienes permiso para esta acción",
  "status": 403
}
```

---

### 6. PATCH /expedientes/{id}
**Actualizar expediente**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Secretaria, Administrador

**Parámetros de Path:**
- `id` (integer): ID del expediente a actualizar

**Body (application/json) - Solo campos a actualizar:**
```json
{
  "etapa": "En trámite",
  "observaciones": "Actualización del estado"
}
```

**Validaciones:**
- Todos los campos son opcionales
- Debe enviarse al menos uno
- `caratula`: Máximo 200 caracteres
- `numeroExpediente`: Integer
- `juzgadoId`: Integer
- `observaciones`: Máximo 5000 caracteres
- `modificadoPor`: **Se asigna automáticamente** desde `req.user.username`

**Respuesta 200 (Exitoso):** Expediente actualizado completo

**Respuesta 404 (No encontrado):**
```json
{
  "message": "Expediente no encontrado",
  "status": 404
}
```

---

### 7. DELETE /expedientes/{id}
**Eliminar expediente**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Administrador

**Parámetros de Path:**
- `id` (integer): ID del expediente a eliminar

**Ejemplo:**
```
DELETE http://localhost:3000/api/expedientes/2
Cookie: [JWT_TOKEN]
```

**Respuesta 204 (Exitoso):** Sin contenido

---

## 👥 PERSONAS

### 8. GET /expedientes/{expedienteId}/personas
**Listar personas de un expediente**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Cualquiera

**Parámetros de Path:**
- `expedienteId` (integer): ID del expediente

**Ejemplo:**
```
GET http://localhost:3000/api/expedientes/1/personas
Cookie: [JWT_TOKEN]
```

**Respuesta 200:**
```json
[
  {
    "id": 1,
    "nombreCompleto": "Ana Pérez",
    "dni": "12345678",
    "rol": "Heredero",
    "expedienteId": 1,
    "createdAt": "2026-01-15T10:30:00.000Z",
    "updatedAt": "2026-01-15T10:30:00.000Z"
  }
]
```

---

### 9. POST /expedientes/{expedienteId}/personas
**Crear persona en expediente**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Secretaria, Administrador

**Parámetros de Path:**
- `expedienteId` (integer): ID del expediente

**Body (application/json):**
```json
{
  "nombreCompleto": "Ana Pérez",
  "dni": "12345678",
  "rol": "Heredero"
}
```

**Validaciones:**
- `nombreCompleto`: Requerido, máximo 150 caracteres
- `dni`: Opcional, máximo 15 caracteres
- `rol`: Requerido (valores válidos: Causante, Heredero, Legatario, Albacea, etc.)
- `creadoPor`: **Se asigna automáticamente** desde `req.user.username`

**Respuesta 201:** Persona creada

---

### 10. PATCH /personas/{id}
**Actualizar persona**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Secretaria, Administrador

**Parámetros de Path:**
- `id` (integer): ID de la persona

**Body (application/json) - Solo campos a actualizar:**
```json
{
  "nombreCompleto": "Ana María Pérez",
  "dni": "12345678"
}
```

**Validaciones:**
- `nombreCompleto` y/o `dni`: Al menos uno es requerido
- `modificadoPor`: **Se asigna automáticamente** desde `req.user.username`
- El rol NO se puede modificar (si es incorrecto, dar de baja y crear de nuevo)

**Respuesta 200:** Persona actualizada

---

### 11. DELETE /personas/{id}
**Eliminar persona**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Administrador

**Parámetros de Path:**
- `id` (integer): ID de la persona

**Respuesta 204:** Exitoso

---

## 💼 BIENES

### 12. GET /expedientes/{expedienteId}/bienes
**Listar bienes de expediente**

**Parámetros de Path:**
- `expedienteId` (integer): ID del expediente

**Respuesta 200:** Array de bienes

---

### 13. POST /expedientes/{expedienteId}/bienes
**Crear bien en expediente**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Secretaria, Administrador

**Body:** Según tu schema `bien.validator.js`

---

### 14. PATCH /bienes/{id}
**Actualizar bien**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Secretaria, Administrador

---

### 15. DELETE /bienes/{id}
**Eliminar bien**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Administrador

---

## 📄 DOCUMENTOS

### 16. GET /expedientes/{expedienteId}/documentos
**Listar documentos de expediente**

---

### 17. POST /expedientes/{expedienteId}/documentos
**Crear documento**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Secretaria, Administrador

---

### 18. PATCH /documentos/{id}
**Actualizar documento**

---

### 19. DELETE /documentos/{id}
**Eliminar documento**

---

## 👨‍💼 USUARIOS

### 20. GET /usuarios
**Listar usuarios**

**Requerimientos:**
- Autenticación: ✅ **Requerida**
- Roles permitidos: Administrador

**Respuesta 200:** Array de usuarios del sistema

---

## 🔄 FLUJO COMPLETO DE EJEMPLO

```bash
# 1. Registrar usuario
POST /auth/register
{
  "nombre": "Juan Pérez",
  "username": "juanperez",
  "password": "MiPassword123@"
}

# 2. Login (obtiene cookie con JWT)
POST /auth/login
{
  "username": "juanperez",
  "password": "MiPassword123@"
}

# 3. Crear expediente (como Secretaria/Admin)
# Nota: creadoPor se asigna automáticamente desde req.user.username
POST /expedientes
{
  "caratula": "Juan Pérez s/sucesión",
  "tipoProceso": "Sucesión",
  "numeroExpediente": 120,
  "juzgadoId": 1
}
# Respuesta: ID expediente = 1

# 4. Agregar personas al expediente
# Nota: creadoPor se asigna automáticamente
POST /expedientes/1/personas
{
  "nombreCompleto": "Ana Pérez",
  "dni": "12345678",
  "rol": "Heredero"
}

# 5. Listar personas
GET /expedientes/1/personas

# 6. Buscar expedientes
GET /expedientes/buscar/Perez

# 7. Actualizar expediente
# Nota: modificadoPor se asigna automáticamente desde req.user.username
PATCH /expedientes/1
{
  "etapa": "En trámite"
}
```

---

## ⚠️ Campos Automáticos

Los siguientes campos **se asignan automáticamente** desde el usuario autenticado (`req.user.username`). **NO deben incluirse en el request:**

| Campo | Cuándo | Valor |
|-------|--------|-------|
| `creadoPor` | POST (crear recurso) | Username del usuario autenticado |
| `modificadoPor` | PATCH (actualizar) | Username del usuario autenticado |

**Beneficio:** No es necesario enviar el username en cada request; se toma automáticamente de la sesión autenticada.

---

## ⚠️ CÓDIGOS DE RESPUESTA

| Código | Significado |
|--------|------------|
| 200 | OK - Solicitud exitosa |
| 201 | Created - Recurso creado |
| 204 | No Content - Eliminado exitosamente |
| 400 | Bad Request - Datos inválidos |
| 401 | Unauthorized - No autenticado o credenciales inválidas |
| 403 | Forbidden - Rol insuficiente o sin permiso |
| 404 | Not Found - Recurso no encontrado |
| 429 | Too Many Requests - Demasiados intentos (rate limiting) |
| 500 | Internal Server Error - Error del servidor |

---

## 🔒 MATRIZ DE PERMISOS

| Endpoint | Pasante | Secretaria | Admin |
|----------|---------|-----------|-------|
| POST /auth/register | ✅ | ✅ | ✅ |
| POST /auth/login | ✅ | ✅ | ✅ |
| GET /expedientes | ✅ | ✅ | ✅ |
| GET /expedientes/buscar | ✅ | ✅ | ✅ |
| POST /expedientes | ❌ | ✅ | ✅ |
| PATCH /expedientes | ❌ | ✅ | ✅ |
| DELETE /expedientes | ❌ | ❌ | ✅ |
| GET personas | ✅ | ✅ | ✅ |
| POST personas | ❌ | ✅ | ✅ |
| PATCH personas | ❌ | ✅ | ✅ |
| DELETE personas | ❌ | ❌ | ✅ |
| GET usuarios | ❌ | ❌ | ✅ |

---

**Versión:** 1.1  
**Última actualización:** 2026-01-23  
**Estado:** Basado en código actual del proyecto - Campos automáticos implementados
