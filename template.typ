// Template Typst: Documento Científico / Reporte Técnico
// Basado en el diseño editorial y visual de reportes de investigación técnica.
// Sin marcas comerciales ni logos corporativos ajenos.

#let project(
  title: [Título del Documento],
  subtitle: none,
  objective: none,
  authors: (),
  date: none,
  doc_id: none,
  header_title: "Reporte de Investigación Técnica",
  body,
) = {
  // Configuración general de página
  set page(
    paper: "us-letter", // 8.5 x 11 in (612 x 792 pt)
    margin: (x: 1in, top: 1in, bottom: 1in),
    header: locate(loc => {
      let page_num = loc.page()
      let total_pages = counter(page).final(loc).at(0)
      
      grid(
        columns: (1fr, auto),
        align(left)[
          #text(font: ("Arial", "Liberation Sans", "Helvetica"), size: 8pt, fill: luma(100))[
            #if date != none [ #date #h(4pt) | #h(4pt) ]
            #header_title
          ]
        ],
        align(right)[
          #if doc_id != none [
            #text(font: ("Courier New", "Liberation Mono"), size: 7.5pt, fill: luma(120))[#doc_id]
          ]
        ]
      )
      #v(-2pt)
      #line(length: 100%, stroke: 0.4pt + luma(200))
    }),
    footer: locate(loc => {
      let page_num = loc.page()
      let total_pages = counter(page).final(loc).at(0)
      
      line(length: 100%, stroke: 0.4pt + luma(200))
      #v(2pt)
      grid(
        columns: (1fr, auto),
        align(left)[
          #text(font: ("Arial", "Liberation Sans", "Helvetica"), size: 8pt, fill: luma(120))[
            #if doc_id != none [ Documento técnico de investigación ] else [ Reporte de investigación ]
          ]
        ],
        align(right)[
          #text(font: ("Arial", "Liberation Sans", "Helvetica"), size: 8pt, fill: luma(80))[
            *#page_num* / #total_pages
          ]
        ]
      )
    })
  )

  // Tipografía base y espaciado
  set text(
    font: ("Times New Roman", "Liberation Serif", "Nimbus Roman"),
    size: 10pt,
    fill: rgb("#111111"),
    lang: "es",
  )
  
  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 0pt,
  )

  // Encabezados
  show heading.where(level: 1): it => {
    v(1.2em, weak: true)
    text(font: ("Times New Roman", "Liberation Serif"), size: 16pt, weight: "bold", fill: black)[#it.body]
    v(0.6em, weak: true)
  }

  show heading.where(level: 2): it => {
    v(1.0em, weak: true)
    text(font: ("Arial", "Liberation Sans"), size: 11.5pt, weight: "bold", fill: black)[#it.body]
    v(0.5em, weak: true)
  }

  show heading.where(level: 3): it => {
    v(0.8em, weak: true)
    text(font: ("Arial", "Liberation Sans"), size: 10.5pt, weight: "bold", fill: black)[#it.body]
    v(0.4em, weak: true)
  }

  // Título principal del documento
  v(0.5em)
  text(
    font: ("Times New Roman", "Liberation Serif"),
    size: 24pt,
    weight: "bold",
    fill: black,
  )[#title]
  
  #v(0.3em)
  #line(length: 100%, stroke: 1.0pt + black)
  #v(0.8em)

  // Bloque de autores / fecha si existen
  if authors.len() > 0 or date != none {
    grid(
      columns: (1fr, auto),
      gutter: 1em,
      [
        #if authors.len() > 0 {
          text(font: ("Arial", "Liberation Sans"), size: 9.5pt, weight: "medium")[
            *Autor(es):* #authors.join(", ")
          ]
        }
      ],
      [
        #if date != none {
          text(font: ("Arial", "Liberation Sans"), size: 9pt, fill: luma(80))[
            #date
          ]
        }
      ]
    )
    #v(0.8em)
  }

  // Cuadro destacado de Objetivo / Pregunta de investigación
  if objective != none {
    v(0.2em)
    text(font: ("Times New Roman", "Liberation Serif"), size: 16pt, weight: "bold")[Objective]
    v(0.4em)
    rect(
      width: 100%,
      fill: rgb("#f8f9fa"),
      stroke: (left: 3pt + rgb("#2b2b2b")),
      inset: (x: 12pt, y: 10pt),
      radius: (right: 2pt),
    )[
      #set text(font: ("Times New Roman", "Liberation Serif"), size: 11pt, style: "normal")
      #set par(justify: true, leading: 0.7em)
      #objective
    ]
    #v(0.8em)
  }

  // Estilo de tablas
  show table: set text(font: ("Times New Roman", "Liberation Serif"), size: 7.5pt)
  show table.cell.where(y: 0): set text(font: ("Arial", "Liberation Sans"), size: 7.2pt, weight: "bold")

  body
}

// Helper: Llamado / Callout para conclusiones o notas
#let callout(title: none, body, fill_color: rgb("#f4f5f7"), border_color: rgb("#4a5568")) = {
  v(0.6em)
  rect(
    width: 100%,
    fill: fill_color,
    stroke: (left: 2.5pt + border_color),
    inset: (x: 10pt, y: 8pt),
    radius: (right: 2pt),
  )[
    #if title != none [
      #text(font: ("Arial", "Liberation Sans"), size: 9.5pt, weight: "bold", fill: border_color)[#title]
      #v(0.3em)
    ]
    #set text(font: ("Times New Roman", "Liberation Serif"), size: 9pt)
    #set par(justify: true, leading: 0.6em)
    #body
  ]
  #v(0.6em)
}

// Helper: Entrada de Referencia estructurada
#let reference-item(
  key: "",
  title: "",
  authors: "",
  year: "",
  url: none,
  context: none,
) = {
  block(width: 100%, inset: (bottom: 8pt))[
    #text(font: ("Arial", "Liberation Sans"), size: 9pt, weight: "bold")[#key]
    #h(4pt)
    #text(font: ("Times New Roman", "Liberation Serif"), size: 9.5pt, weight: "bold")[#title]
    #h(4pt)
    #text(font: ("Times New Roman", "Liberation Serif"), size: 9pt)[#authors (#year).]
    #if url != none [
      \ #text(font: ("Courier New", "Liberation Mono"), size: 8pt, fill: rgb("#0056b3"))[#link(url)[#url]]
    ]
    #if context != none [
      \ #text(font: ("Times New Roman", "Liberation Serif"), size: 8.5pt, style: "italic", fill: luma(80))[Context: "#context"]
    ]
  ]
}