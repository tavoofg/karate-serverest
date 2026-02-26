# Karate DSL - Automatización API ServeRest

Suite de pruebas automatizadas para la API de Usuarios de [ServeRest](https://serverest.dev/) utilizando Karate DSL.

## Tecnologías

- Java 21
- Maven 3.9.12
- Karate DSL 1.4.1
- JUnit 5

## Estructura del Proyecto
```
src/test/java/
├── karate-config.js              # Configuración global (baseUrl)
└── karate/
    ├── TestRunner.java           # Runner principal
    ├── test-data.js              # Datos de prueba centralizados
    ├── helpers.feature           # Utilidades reutilizables
    └── usuarios/
        ├── listar_usuarios.feature
        ├── registrar_usuario.feature
        ├── buscar_usuario.feature
        ├── actualizar_usuario.feature
        └── eliminar_usuario.feature
```

## Requisitos Previos

- Java 21 o superior
- Maven 3.9+

## Instalación

1. Clonar el repositorio:
```bash
git clone https://github.com/tavoofg/karate-serverest.git
cd karate-serverest
```

2. Instalar dependencias:
```bash
mvn install -DskipTests
```

## Ejecución

### Ejecutar todos los tests:
```bash
mvn test
```

### Ejecutar solo tests @smoke:
```bash
mvn test -Dkarate.options="--tags @smoke"
```

### Ejecutar solo tests positivos:
```bash
mvn test -Dkarate.options="--tags @positive"
```

### Ejecutar solo tests negativos:
```bash
mvn test -Dkarate.options="--tags @negative"
```

## Reporte

Al ejecutar los tests se genera un reporte HTML automáticamente en:
```
target/karate-reports/karate-summary.html
```

Abre ese archivo en el navegador para ver el reporte detallado.

## Cobertura de Tests

| Endpoint | Método | Casos Positivos | Casos Negativos |
|----------|--------|----------------|----------------|
| /usuarios | GET | 3 | 0 |
| /usuarios | POST | 2 | 3 |
| /usuarios/{_id} | GET | 1 | 1 |
| /usuarios/{_id} | PUT | 2 | 1 |
| /usuarios/{_id} | DELETE | 1 | 1 |

## Estrategia de Automatización

Ver [ESTRATEGIA.md](ESTRATEGIA.md) para más detalles.