# Estrategia de Automatización - ServeRest API

## 1. Enfoque General

La estrategia se basa en pruebas de API REST automatizadas utilizando **Karate DSL**,
un framework que combina la sintaxis BDD de Gherkin con capacidades nativas para
pruebas de servicios web, eliminando la necesidad de código Java adicional para
las aserciones y validaciones.

## 2. Patrones Utilizados

### Data-Driven Testing
Se centralizaron todos los datos de prueba en `test-data.js`, separando
los datos del código de prueba. Esto permite:
- Modificar datos sin tocar los feature files
- Reutilizar datos entre diferentes escenarios
- Generar datos dinámicos con timestamps para evitar conflictos

### Page Object Pattern (adaptado a API)
Cada endpoint tiene su propio feature file, siguiendo el principio de
responsabilidad única:
- `listar_usuarios.feature` → GET /usuarios
- `registrar_usuario.feature` → POST /usuarios
- `buscar_usuario.feature` → GET /usuarios/{_id}
- `actualizar_usuario.feature` → PUT /usuarios/{_id}
- `eliminar_usuario.feature` → DELETE /usuarios/{_id}

### Helper Pattern
El archivo `helpers.feature` contiene escenarios reutilizables marcados
con `@ignore` que pueden ser invocados desde cualquier feature file,
evitando duplicación de código.

## 3. Organización de Tests por Tags

| Tag | Descripción |
|-----|-------------|
| @smoke | Tests críticos de flujo principal |
| @positive | Casos de uso exitosos |
| @negative | Casos de error y validación |

## 4. Validación de Esquemas JSON

Se utilizan los fuzzy matchers de Karate para validar la estructura
de las respuestas:
- `#string` → valida que el campo sea de tipo string
- `#number` → valida que el campo sea numérico
- `#array` → valida que el campo sea un array

Ejemplo:
```
And match response == { _id: '#string', nome: '#string', email: '#string', password: '#string', administrador: '#string' }
```

## 5. Manejo de Datos Dinámicos

Para evitar conflictos con datos existentes en el ambiente de pruebas,
se utiliza timestamp en la generación de emails:
```javascript
email: 'admin_' + timestamp + '@qa.com'
```

## 6. Cobertura de Pruebas

Se implementaron escenarios para todos los verbos HTTP del CRUD:
- **Happy Path**: flujos exitosos con datos válidos
- **Negative Testing**: validación de errores con datos inválidos o inexistentes
- **Boundary Testing**: campos vacíos y IDs inexistentes

## 7. Reporte de Resultados

Karate genera automáticamente un reporte HTML detallado en
`target/karate-reports/karate-summary.html` con:
- Resumen de tests ejecutados
- Detalle de cada escenario
- Tiempo de ejecución
- Requests y responses completos