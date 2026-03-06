---
tags: [moc, index, api]
created: 2026-03-05
updated: 2026-03-05
---

# API Documentation

Documentación de API de [[PROJECT_NAME]].

## 🌐 Endpoints

### Autenticación
| Método | Endpoint | Descripción | Auth |
|--------|----------|-------------|------|
| POST | /api/auth/login | Login | No |
| POST | /api/auth/refresh | Refresh token | No |
| POST | /api/auth/logout | Logout | Sí |

### Recursos Principales
| Método | Endpoint | Descripción | Auth |
|--------|----------|-------------|------|
| GET | /api/v1/resource | Listar | Sí |
| POST | /api/v1/resource | Crear | Sí |
| GET | /api/v1/resource/:id | Obtener | Sí |
| PUT | /api/v1/resource/:id | Actualizar | Sí |
| DELETE | /api/v1/resource/:id | Eliminar | Sí |

## 📋 Schemas

### Request/Response
*[Definir schemas principales]*

### Códigos de Error
| Código | Descripción |
|--------|-------------|
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Server Error |

## 🔐 Autenticación

- **Tipo:** JWT Bearer
- **Header:** `Authorization: Bearer <token>`
- **Refresh:** Via endpoint /refresh

## 📖 Swagger/OpenAPI

- **URL:** `/api/docs/`
- **Generación:** Automática desde código
- **Actualización:** En cada deploy

## 🧪 Testing API

```bash
# Ejemplo curl
curl -H "Authorization: Bearer $TOKEN" \
     https://api.example.com/v1/resource
```

## Links

- [[Architecture Decisions]]
- [[Testing Strategy]]
- [[Security & Privacy]]

---

*Keep this updated as API evolves*
