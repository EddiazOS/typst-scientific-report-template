# Typst Scientific Report Template

Plantilla limpia y profesional para Typst, diseñada para la redacción de propuestas de investigación, reportes técnicos y revisiones sistemáticas de literatura científica.

## Características de Diseño

- **Tipografía rigurosa**: Cuerpo de texto en Times New Roman / Liberation Serif (10 pt), encabezados técnicos en Arial / Liberation Sans (10.5 - 11.5 pt) y título principal (24 pt).
- **Estructura visual sobria**: Separadores geométricos finos, grillas de metadatos limpias y ausencia total de logos corporativos o marcas no deseadas.
- **Cuadro de Objetivo / Pregunta de investigación**: Bloque resaltado con fondo neutro suave (`#f8f9fa`) y barra lateral sólida para resaltar la formulación central.
- **Tablas técnicas optimizadas**: Cabeceras en negrita con tipografía sin serifa (7.2 pt) y celdas compactas (7.5 pt) diseñadas para condensar comparaciones de literatura y resultados multivariantes.
- **Callouts y notas**: Bloques de advertencia o hallazgos clave con bordes laterales personalizables.
- **Sección de referencias context-aware**: Formato estructurado para citar fuentes con metadatos y extracto contextual de evidencia.

## Estructura de Archivos

- `template.typ`: Función principal `#project` y componentes reutilizables (`callout`, `reference-item`).
- `example.typ`: Ejemplo completo y funcional listo para compilar con la estructura del proyecto de investigación FTIR.

## Uso Rápido

1. Asegúrate de tener instalado [Typst](https://typst.app) (`typst --version`).
2. Clona este repositorio:
   ```bash
   git clone https://github.com/EddiazOS/typst-scientific-report-template.git
   cd typst-scientific-report-template
   ```
3. Compila el documento de ejemplo a PDF:
   ```bash
   typst compile example.typ output.pdf
   ```
4. O inicia el modo de observación interactiva:
   ```bash
   typst watch example.typ
   ```
