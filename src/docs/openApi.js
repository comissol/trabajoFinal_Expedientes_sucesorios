const spec = {
  "openapi": "3.0.0",
  "info": {
    "title": "API Expedientes Sucesorios",
    "version": "1.0.0",
    "description": "Sistema de gestión de expedientes sucesorios con autenticación por roles",
    "contact": {
      "name": "Contacto de soporte",
      "email": "comissol92@gmail.com"
    }
  },
  "servers": [
    {
      "url": "http://localhost:3000/api",
      "description": "Servidor de desarrollo"
    },
  ],
  "components": {
    "securitySchemes": {
      "cookieAuth": {
        "type": "apiKey",
        "in": "cookie",
        "name": "Authorization",
        "description": "JWT token enviado en cookie después de login"
      }
    },
    "schemas": {
      "Usuario": {
        "type": "object",
        "required": ["nombre", "username", "password"],
        "properties": {
          "id": {
            "type": "integer",
            "example": 1
          },
          "nombre": {
            "type": "string",
            "maxLength": 100,
            "example": "Juan Pérez"
          },
          "username": {
            "type": "string",
            "minLength": 3,
            "maxLength": 50,
            "pattern": "^[a-zA-Z0-9]+$",
            "example": "juanperez"
          },
          "password": {
            "type": "string",
            "minLength": 8,
            "maxLength": 72,
            "pattern": "^[a-zA-Z0-9@*]+$",
            "description": "Solo para creación/actualización",
            "example": "MiPassword123@"
          },
          "rol": {
            "type": "string",
            "enum": ["Pasante", "Secretaria", "Administrador"],
            "default": "Pasante",
            "example": "Secretaria"
          },
          "activo": {
            "type": "boolean",
            "default": true,
            "example": true
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          },
          "updatedAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "LoginRequest": {
        "type": "object",
        "required": ["username", "password"],
        "properties": {
          "username": {
            "type": "string",
            "maxLength": 50,
            "example": "juanperez"
          },
          "password": {
            "type": "string",
            "maxLength": 72,
            "example": "MiPassword123@"
          }
        }
      },
      "LoginResponse": {
        "type": "object",
        "properties": {
          "username": {
            "type": "string",
            "example": "juanperez"
          },
          "rol": {
            "type": "string",
            "enum": ["Pasante", "Secretaria", "Administrador"],
            "example": "Secretaria"
          }
        }
      },
      "RegisterRequest": {
        "type": "object",
        "required": ["nombre", "username", "password"],
        "properties": {
          "nombre": {
            "type": "string",
            "maxLength": 100,
            "example": "Juan Pérez"
          },
          "username": {
            "type": "string",
            "minLength": 3,
            "maxLength": 50,
            "pattern": "^[a-zA-Z0-9]+$",
            "example": "juanperez"
          },
          "password": {
            "type": "string",
            "minLength": 8,
            "maxLength": 72,
            "pattern": "^[a-zA-Z0-9@*]+$",
            "example": "MiPassword123@"
          }
        }
      },
      "Expediente": {
        "type": "object",
        "required": ["caratula", "tipoProceso", "numeroExpediente", "juzgadoId", "creadoPor"],
        "properties": {
          "id": {
            "type": "integer",
            "example": 1
          },
          "caratula": {
            "type": "string",
            "maxLength": 200,
            "example": "Juan Pérez s/sucesión"
          },
          "tipoProceso": {
            "type": "string",
            "example": "Sucesión"
          },
          "numeroExpediente": {
            "type": "integer",
            "example": 120
          },
          "juzgadoId": {
            "type": "integer",
            "example": 1
          },
          "observaciones": {
            "type": "string",
            "maxLength": 5000,
            "example": "Expediente de sucesión con herederos múltiples"
          },
          "etapa": {
            "type": "string",
            "enum": ["Iniciado", "En trámite", "Resuelto", "Cerrado"],
            "default": "Iniciado",
            "example": "Iniciado"
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          },
          "updatedAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "Persona": {
        "type": "object",
        "required": ["nombreCompleto", "rol", "creadoPor"],
        "properties": {
          "id": {
            "type": "integer",
            "example": 1
          },
          "nombreCompleto": {
            "type": "string",
            "maxLength": 150,
            "example": "Ana Pérez"
          },
          "dni": {
            "type": "string",
            "maxLength": 15,
            "example": "12345678"
          },
          "rol": {
            "type": "string",
            "enum": ["Causante", "Heredero", "Legatario", "Albacea"],
            "example": "Heredero"
          },
          "expedienteId": {
            "type": "integer",
            "example": 1
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          },
          "updatedAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "Bien": {
        "type": "object",
        "properties": {
          "id": {
            "type": "integer",
            "example": 1
          },
          "descripcion": {
            "type": "string",
            "example": "Casa de dos pisos"
          },
          "tipo": {
            "type": "string",
            "enum": ["Inmueble", "Vehículo", "Dinero", "Joyas", "Otros"],
            "example": "Inmueble"
          },
          "valor": {
            "type": "number",
            "format": "float",
            "example": 500000.00
          },
          "ubicacion": {
            "type": "string",
            "example": "Calle 10 Nro. 500"
          },
          "estado": {
            "type": "string",
            "enum": ["Inventariado", "Adjudicado", "Vendido", "En proceso"],
            "example": "Inventariado"
          },
          "expedienteId": {
            "type": "integer",
            "example": 1
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          },
          "updatedAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "Documento": {
        "type": "object",
        "properties": {
          "id": {
            "type": "integer",
            "example": 1
          },
          "nombre": {
            "type": "string",
            "example": "Testamento"
          },
          "tipo": {
            "type": "string",
            "enum": ["Testamento", "Escritura", "Certificado", "Inventario", "Sentencia", "Otros"],
            "example": "Testamento"
          },
          "url": {
            "type": "string",
            "format": "uri",
            "example": "https://storage.example.com/docs/testamento.pdf"
          },
          "fechaCarga": {
            "type": "string",
            "format": "date",
            "example": "2026-01-15"
          },
          "expedienteId": {
            "type": "integer",
            "example": 1
          },
          "createdAt": {
            "type": "string",
            "format": "date-time"
          },
          "updatedAt": {
            "type": "string",
            "format": "date-time"
          }
        }
      },
      "Error": {
        "type": "object",
        "properties": {
          "message": {
            "type": "string"
          },
          "status": {
            "type": "integer"
          }
        }
      }
    }
  },
  "paths": {
    "/auth/register": {
      "post": {
        "tags": ["Autenticación"],
        "summary": "Registrar nuevo usuario",
        "description": "Crea un nuevo usuario con rol Pasante por defecto",
        "operationId": "registerUser",
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/RegisterRequest"
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "Usuario registrado exitosamente",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/Usuario"
                }
              }
            }
          },
          "400": {
            "description": "Datos inválidos o usuario ya existe",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/Error"
                }
              }
            }
          },
          "429": {
            "description": "Demasiados intentos de registro"
          }
        }
      }
    },
    "/auth/login": {
      "post": {
        "tags": ["Autenticación"],
        "summary": "Login de usuario",
        "description": "Autentica un usuario y retorna JWT en cookie",
        "operationId": "loginUser",
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/LoginRequest"
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Login exitoso",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/LoginResponse"
                }
              }
            },
            "headers": {
              "Set-Cookie": {
                "schema": {
                  "type": "string"
                },
                "description": "JWT token en cookie"
              }
            }
          },
          "401": {
            "description": "Credenciales inválidas",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/Error"
                }
              }
            }
          },
          "429": {
            "description": "Demasiados intentos de login"
          }
        }
      }
    },
    "/expedientes": {
      "get": {
        "tags": ["Expedientes"],
        "summary": "Listar expedientes",
        "description": "Obtiene lista de expedientes con filtros opcionales",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {
            "name": "numeroExpediente",
            "in": "query",
            "description": "Filtrar por número de expediente",
            "schema": {
              "type": "integer"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Lista de expedientes",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "$ref": "#/components/schemas/Expediente"
                  }
                }
              }
            }
          },
          "401": {
            "description": "No autenticado"
          }
        }
      },
      "post": {
        "tags": ["Expedientes"],
        "summary": "Crear nuevo expediente",
        "description": "Crea un nuevo expediente (requiere Secretaria o Admin)",
        "security": [{"cookieAuth": []}],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/Expediente"
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "Expediente creado",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/Expediente"
                }
              }
            }
          },
          "400": {
            "description": "Datos inválidos"
          },
          "401": {
            "description": "No autenticado"
          },
          "403": {
            "description": "Acceso denegado"
          }
        }
      }
    },
    "/expedientes/buscar/{busqueda}": {
      "get": {
        "tags": ["Expedientes"],
        "summary": "Buscar expedientes",
        "description": "Busca expedientes por término",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {
            "name": "busqueda",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "maxLength": 100
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Resultados de búsqueda",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {
                    "$ref": "#/components/schemas/Expediente"
                  }
                }
              }
            }
          },
          "401": {
            "description": "No autenticado"
          }
        }
      }
    },
    "/expedientes/{id}": {
      "patch": {
        "tags": ["Expedientes"],
        "summary": "Actualizar expediente",
        "description": "Actualiza un expediente existente",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "integer"
            }
          }
        ],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "caratula": {"type": "string"},
                  "tipoProceso": {"type": "string"},
                  "numeroExpediente": {"type": "integer"},
                  "juzgadoId": {"type": "integer"},
                  "observaciones": {"type": "string"},
                  "etapa": {"type": "string"},
                  "modificadoPor": {"type": "integer"}
                },
                "required": ["modificadoPor"]
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "Expediente actualizado",
            "content": {
              "application/json": {
                "schema": {
                  "$ref": "#/components/schemas/Expediente"
                }
              }
            }
          },
          "400": {"description": "Datos inválidos"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"},
          "404": {"description": "Expediente no encontrado"}
        }
      },
      "delete": {
        "tags": ["Expedientes"],
        "summary": "Eliminar expediente",
        "description": "Elimina un expediente (solo Admin)",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {"type": "integer"}
          }
        ],
        "responses": {
          "204": {"description": "Expediente eliminado"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"},
          "404": {"description": "Expediente no encontrado"}
        }
      }
    },
    "/expedientes/{expedienteId}/personas": {
      "get": {
        "tags": ["Personas"],
        "summary": "Listar personas de expediente",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {
            "name": "expedienteId",
            "in": "path",
            "required": true,
            "schema": {"type": "integer"}
          }
        ],
        "responses": {
          "200": {
            "description": "Lista de personas",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {"$ref": "#/components/schemas/Persona"}
                }
              }
            }
          },
          "401": {"description": "No autenticado"},
          "404": {"description": "Expediente no encontrado"}
        }
      },
      "post": {
        "tags": ["Personas"],
        "summary": "Crear persona",
        "description": "Agrega una nueva persona a un expediente",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {
            "name": "expedienteId",
            "in": "path",
            "required": true,
            "schema": {"type": "integer"}
          }
        ],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {"$ref": "#/components/schemas/Persona"}
            }
          }
        },
        "responses": {
          "201": {"description": "Persona creada", "content": {"application/json": {"schema": {"$ref": "#/components/schemas/Persona"}}}},
          "400": {"description": "Datos inválidos"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"},
          "404": {"description": "Expediente no encontrado"}
        }
      }
    },
    "/personas/{id}": {
      "patch": {
        "tags": ["Personas"],
        "summary": "Actualizar persona",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "id", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "nombreCompleto": {"type": "string"},
                  "dni": {"type": "string"},
                  "modificadoPor": {"type": "integer"}
                }
              }
            }
          }
        },
        "responses": {
          "200": {"description": "Persona actualizada"},
          "400": {"description": "Datos inválidos"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"},
          "404": {"description": "Persona no encontrada"}
        }
      },
      "delete": {
        "tags": ["Personas"],
        "summary": "Eliminar persona",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "id", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "responses": {
          "204": {"description": "Persona eliminada"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"},
          "404": {"description": "Persona no encontrada"}
        }
      }
    },
    "/expedientes/{expedienteId}/bienes": {
      "get": {
        "tags": ["Bienes"],
        "summary": "Listar bienes",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "expedienteId", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "responses": {
          "200": {
            "description": "Lista de bienes",
            "content": {
              "application/json": {
                "schema": {"type": "array", "items": {"$ref": "#/components/schemas/Bien"}}
              }
            }
          }
        }
      },
      "post": {
        "tags": ["Bienes"],
        "summary": "Crear bien",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "expedienteId", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "requestBody": {
          "required": true,
          "content": {
            "application/json": {"schema": {"$ref": "#/components/schemas/Bien"}}
          }
        },
        "responses": {
          "201": {"description": "Bien creado"},
          "400": {"description": "Datos inválidos"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"}
        }
      }
    },
    "/bienes/{id}": {
      "patch": {
        "tags": ["Bienes"],
        "summary": "Actualizar bien",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "id", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "responses": {
          "200": {"description": "Bien actualizado"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"},
          "404": {"description": "Bien no encontrado"}
        }
      },
      "delete": {
        "tags": ["Bienes"],
        "summary": "Eliminar bien",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "id", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "responses": {
          "204": {"description": "Bien eliminado"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"}
        }
      }
    },
    "/expedientes/{expedienteId}/documentos": {
      "get": {
        "tags": ["Documentos"],
        "summary": "Listar documentos",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "expedienteId", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "responses": {
          "200": {
            "description": "Lista de documentos",
            "content": {
              "application/json": {
                "schema": {"type": "array", "items": {"$ref": "#/components/schemas/Documento"}}
              }
            }
          }
        }
      },
      "post": {
        "tags": ["Documentos"],
        "summary": "Crear documento",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "expedienteId", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "responses": {
          "201": {"description": "Documento creado"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"}
        }
      }
    },
    "/documentos/{id}": {
      "patch": {
        "tags": ["Documentos"],
        "summary": "Actualizar documento",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "id", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "responses": {
          "200": {"description": "Documento actualizado"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"}
        }
      },
      "delete": {
        "tags": ["Documentos"],
        "summary": "Eliminar documento",
        "security": [{"cookieAuth": []}],
        "parameters": [
          {"name": "id", "in": "path", "required": true, "schema": {"type": "integer"}}
        ],
        "responses": {
          "204": {"description": "Documento eliminado"},
          "401": {"description": "No autenticado"},
          "403": {"description": "Acceso denegado"}
        }
      }
    },
    "/usuarios": {
      "get": {
        "tags": ["Usuarios"],
        "summary": "Listar usuarios",
        "description": "Lista todos los usuarios (solo Admin)",
        "security": [{"cookieAuth": []}],
        "responses": {
          "200": {
            "description": "Lista de usuarios",
            "content": {
              "application/json": {
                "schema": {
                  "type": "array",
                  "items": {"$ref": "#/components/schemas/Usuario"}
                }
              }
            }
          },
          "401": {"description": "No autenticado"},
          "403": {"description": "Solo administradores"}
        }
      }
    }
  }
};

export default spec;