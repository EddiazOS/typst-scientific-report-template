#import "template.typ": project, callout, reference-item

#show: project.with(
  title: [Precedent Results: Evaluación de Arquitecturas Profundas e Informadas por Física en FTIR],
  subtitle: [Revisión Sistemática de Literatura y Marco Teórico de Degradación Fisicoquímica],
  objective: [
    ¿En qué medida la literatura científica actual ha explorado arquitecturas híbridas de aprendizaje
    profundo —que integren codificadores espectrales basados en atención o grafos (Transformer/GNN),
    modelado temporal eficiente (LSTM, GRU o modelos de espacio de estados tipo Mamba) y
    restricciones cinéticas informadas por física (PINN/Neural ODE)— para predecir la degradación
    temporal de propiedades fisicoquímicas a partir de espectros FTIR en alimentos de alto valor
    comercial como cacao, café, miel y aceite de coco, y qué vacíos metodológicos persisten respecto a la
    integración multi-matriz y la interpretabilidad química de dichos modelos?
  ],
  authors: ("Edgar Luis Diaz",),
  date: "17 de septiembre de 2026",
  doc_id: "REV-FTIR-2026-001",
  header_title: "Investigación en Espectroscopía y Deep Learning",
)

= Results

No. \# Estado de la literatura

== Conclusión ejecutiva

La literatura científica ha explorado los componentes de la arquitectura propuesta, pero casi siempre por
separado. En las búsquedas exhaustivas no se identificó ningún trabajo que combine de forma holística, sobre
series longitudinales FTIR de cacao, café, miel o aceite de coco, los tres niveles siguientes:

1. Codificación espectral mediante Transformers o GNN estructurados sobre bandas funcionales.
2. Modelado de series temporales largas o dinámicas con arquitecturas tipo Mamba, SSM o RNN avanzadas.
3. Restricciones cinéticas explícitas (PINN o Neural ODE) fundamentadas en leyes de degradación (Arrhenius, cinética de orden 1 u oxidación autocatalítica).

#callout(title: "Hallazgo Principal")[
  Existe viabilidad técnica demostrada a nivel de componentes aislados, pero un vacío sustantivo en cuanto a la integración conjunta y la validación multi-matriz estandarizada.
]

= Comparativa de Estado del Arte

#table(
  columns: (1.2fr, 1.5fr, 1.5fr, 1.8fr, 2.5fr),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black, top: 1pt + black) } else { (bottom: 0.5pt + luma(200)) },
  fill: (col, row) => if row == 0 { rgb("#f0f3f6") } else { none },
  inset: (x: 5pt, y: 6pt),
  [Matriz], [FTIR / Rango], [Codificador], [Restricción Cinética], [Vacío Metodológico Clave],
  [Café], [FTIR & FT-NIR], [PCA, PLS, 1D-CNN], [Sin acople espectral], [Falta modelar degradación continua y cinética de almacenamiento.],
  [Miel], [ATR-FTIR], [PLS-DA, CNN-ANN], [No identificada], [Enfoque casi exclusivo en adulteración comercial puntual.],
  [Aceite de coco], [FTIR], [KNN, PLS, 1D-CNN], [Modelos empíricos], [Escasa validación longitudinal de peróxidos y acidez.],
  [Cacao], [FTIR / NIR], [PLS, Random Forest], [No identificada], [Ausencia de benchmarks públicos y seguimiento temporal.],
)

= Discusión Técnica y Perspectivas

== 1. Codificación de Grafos vs. Transformadores Espectrales

A diferencia de una señal unidimensional genérica, los espectros infrarrojos poseen una semántica físico-química estricta. Las bandas de absorción están asociadas a modos vibracionales de enlaces covalentes específicos.

== 2. Restricciones Cinéticas y Modelado Físico

La incorporación de ecuaciones diferenciales ordinarias en el bucle de optimización (Neural ODE / PINN) previene que la red aprenda correlaciones espurias dependientes exclusivamente del lote o del tiempo transcurrido.

= References

#reference-item(
  key: "[1.1]",
  title: "Multi-Path Attention Fusion Transformer for Spectral Learning",
  authors: "Smith, J. et al.",
  year: "2025",
  url: "https://doi.org/10.1016/j.foodchem.2025.145932",
  context: "Demuestra la viabilidad de mecanismos de atención directa sobre bandas espectrales infrarrojas."
)

#reference-item(
  key: "[1.2]",
  title: "Physics-Informed Neural Networks for Food Kinetic Modeling and Degradation",
  authors: "Rodriguez, A. et al.",
  year: "2025",
  url: "https://doi.org/10.1016/j.jfoodeng.2025.109876",
  context: "Aplica PINN para resolver cinéticas de degradación acopladas a parámetros de calidad postcosecha."
)