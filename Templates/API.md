---
cssclass: api-documentation
tags:
  - api
  - documentation
  - technical
version: "1.0.0"
base_url: ""
auth: ""
created: "{{date:YYYY-MM-DD}}"
modified: "{{date:YYYY-MM-DD}}"
---

# API: {{title}}

## Información General

- **Nombre:** {{title}}
- **Versión:** 1.0.0
- **Base URL:** `https://api.ejemplo.com/v1`
- **Autenticación:** Bearer Token / API Key / OAuth2
- **Formato:** JSON
- **Creado:** {{date:YYYY-MM-DD}}

## Autenticación

### Bearer Token

```bash
curl -H "Authorization: Bearer {token}" \
     https://api.ejemplo.com/v1/recurso
```

### API Key

```bash
curl -H "X-API-Key: {api_key}" \
     https://api.ejemplo.com/v1/recurso
```

## Endpoints

### GET /recurso

Obtiene lista de recursos.

#### Parámetros de Query

| Parámetro | Tipo | Requerido | Descripción |
|-----------|------|-----------|-------------|
| page | int | No | Número de página (default: 1) |
| limit | int | No | Items por página (default: 20) |
| search | string | No | Término de búsqueda |

#### Respuesta

```json
{
  "data": [
    {
      "id": 1,
      "nombre": "Ejemplo",
      "created_at": "2024-01-01T00:00:00Z"
    }
  ],
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}
```

#### Códigos de Estado

- `200 OK` - Éxito
- `401 Unauthorized` - No autenticado
- `403 Forbidden` - Sin permisos

### GET /recurso/{id}

Obtiene un recurso específico.

#### Parámetros de Path

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| id | int | ID del recurso |

#### Respuesta

```json
{
  "id": 1,
  "nombre": "Ejemplo",
  "descripcion": "Descripción del recurso",
  "created_at": "2024-01-01T00:00:00Z",
  "updated_at": "2024-01-01T00:00:00Z"
}
```

### POST /recurso

Crea un nuevo recurso.

#### Body

```json
{
  "nombre": "Nuevo recurso",
  "descripcion": "Descripción"
}
```

#### Respuesta

- `201 Created` - Recurso creado
- `400 Bad Request` - Datos inválidos
- `422 Unprocessable Entity` - Error de validación

### PUT /recurso/{id}

Actualiza un recurso existente.

### DELETE /recurso/{id}

Elimina un recurso.

## Modelos

### Recurso

| Campo | Tipo | Descripción |
|-------|------|-------------|
| id | int | Identificador único |
| nombre | string | Nombre del recurso |
| descripcion | string | Descripción |
| created_at | datetime | Fecha de creación |
| updated_at | datetime | Fecha de actualización |

## Errores

### Formato de Error

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Descripción del error",
    "details": {}
  }
}
```

### Códigos de Error

| Código | Descripción |
|--------|-------------|
| INVALID_REQUEST | Solicitud malformada |
| UNAUTHORIZED | No autenticado |
| FORBIDDEN | Sin permisos |
| NOT_FOUND | Recurso no encontrado |
| VALIDATION_ERROR | Error de validación |

## Rate Limiting

- **Límite:** 1000 requests / hora
- **Headers:**
  - `X-RateLimit-Limit`
  - `X-RateLimit-Remaining`
  - `X-RateLimit-Reset`

## Implementación

### Python

```python
import requests

response = requests.get(
    "https://api.ejemplo.com/v1/recurso",
    headers={"Authorization": f"Bearer {token}"}
)
data = response.json()
```

### JavaScript

```javascript
const response = await fetch('https://api.ejemplo.com/v1/recurso', {
  headers: {
    'Authorization': `Bearer ${token}`
  }
});
const data = await response.json();
```

## Referencias

- [[Backend - Servicio relacionado]]
- [[Testing - API Tests]]
- [[Documentación técnica adicional]]

---
*Documentación creada: {{date:YYYY-MM-DD}}*
