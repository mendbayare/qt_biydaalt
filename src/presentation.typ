#set text(font: "Liberation Sans")
#import "@preview/diatypst:0.9.1": *

#show: slides.with(
  title: "Программ хангамжийн модульчлагдах байдал",
  subtitle: "Модульчлал ба түүний чанарт үзүүлэх нөлөө",
  date: "2025.05.21",
  authors: ("Э.Мэндбаяр - 23b1num0038"),
  ratio: 16/9,
  layout: "medium",
  title-color: rgb("#1e40af"), // Premium royal blue
  bg-color: rgb("#f8fafc"),    // Very clean light grey/blue tint
  toc: true,
  count: "number",
)

// Re-designed highly polished block helper
#let defbox(body) = block(
  width: 100%,
  fill: rgb("#eff6ff"),
  stroke: (left: 3pt + rgb("#1d4ed8")),
  radius: (right: 6pt),
  inset: (left: 12pt, right: 10pt, y: 8pt),
  body
)

// Helper for beautiful side-by-side metric boxes
#let metric-box(title, sub, body, color: rgb("#1e40af")) = block(
  width: 100%,
  stroke: 1pt + color.lighten(60%),
  fill: color.lighten(95%),
  radius: 8pt,
  inset: 15pt,
  [
    #text(weight: "bold", size: 1.15em, fill: color.darken(10%))[#title] \
    #v(2pt)
    #text(style: "italic", size: 0.85em, fill: color.darken(25%))[#sub] \
    #v(8pt)
    #text(size: 0.95em, fill: rgb("#1e293b"))[#body]
  ]
)

= Оршил

== Орчин үеийн ПХ-ийн тулгамдсан асуудал

#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,
  [
    #block(
      fill: rgb("#fef2f2"),
      stroke: (left: 4pt + rgb("#dc2626")),
      inset: 12pt,
      radius: 6pt,
      width: 100%,
      [
        #text(weight: "bold", fill: rgb("#991b1b"), size: 1.1em)[Нөхцөл байдал & Хүндрэлүүд] \
        #v(6pt)
        Орчин үеийн программ хангамжийн системүүд улам бүр нүсэр, нарийн төвөгтэй болж байна. Үүнээс үүдэн:
        - *Чанарыг хадгалах* хүндрэлтэй болдог
        - *Гарсан алдааг засварлах* хугацаа уртасдаг
        - *Шинэ боломжоор өргөтгөхөд* өмнөх кодууд эвдэрдэг
      ]
    )
  ],
  [
    #block(
      fill: rgb("#f0fdf4"),
      stroke: (left: 4pt + rgb("#16a34a")),
      inset: 12pt,
      radius: 6pt,
      width: 100%,
      [
        #text(weight: "bold", fill: rgb("#166534"), size: 1.1em)[Инженерчлэлийн Шийдэл] \
        #v(6pt)
        Эдгээр асуудлуудыг шийдвэрлэх хамгийн оновчтой бөгөөд шинжлэх ухааны суурь арга зам нь:
        
        #v(8pt)
        #align(center)[
          #block(
            fill: rgb("#dcfce7"),
            inset: (x: 12pt, y: 10pt),
            radius: 6pt,
            stroke: 1pt + rgb("#16a34a"),
            text(weight: "bold", fill: rgb("#15803d"), size: 1.05em)[Модульчлагдах байдал \ (Modularity)]
          )
        ]
        #v(4pt)
        нэмэгдүүлэх явдал юм.
      ]
    )
  ]
)


= Үндсэн ойлголт

== Модульчлагдах байдал гэж юу вэ?
#align(center)[
  #block(
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    inset: 6pt,
    fill: white,
    [#image("tree-new.png", height: 75%)]
  )
]

== Модульчлагдах байдал гэж юу вэ?

ISO/IEC 25010:2023 стандартад @ISO25010:2023 модульчлагдах байдлыг дараах байдлаар тодорхойлсон байна. Үүнд:

#v(8pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,
  block(
    fill: rgb("#f0fdfa"),
    stroke: (left: 4pt + rgb("#0f766e")),
    inset: 14pt,
    radius: 6pt,
    width: 100%,
    [
      #text(weight: "bold", fill: rgb("#0f766e"), size: 1.1em)[Монгол хэлээр] \
      #v(6pt)
      *Модульчлагдах байдал:* \
      Бүтээгдэхүүний нэг бүрэлдэхүүн хэсэгт оруулсан өөрчлөлт нь бусад бүрэлдэхүүн хэсгүүдэд нөлөөлөх нөлөөллийг хязгаарлах чадвар.
    ]
  ),
  block(
    fill: rgb("#eff6ff"),
    stroke: (left: 4pt + rgb("#1e40af")),
    inset: 14pt,
    radius: 6pt,
    width: 100%,
    [
      #text(weight: "bold", fill: rgb("#1e40af"), size: 1.1em)[Англи хэлээр] \
      #v(6pt)
      *Modularity:* \
      Capability of a product to limit changes to one component from affecting other components.
    ]
  )
)


= Хэмжээс

== Модульчлагдах чадварын үндсэн 2 хэмжээс

#align(center)[
  #text(style: "italic", fill: gray.darken(20%), size: 0.95em)[Ларри Константин (1960-аад оны сүүл @yourdon1979structured)]
]
#v(6pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  metric-box(
    "Нэгдмэл байдал (Cohesion)",
    "Дотоод уялдаа холбоо",
    [Модуль доторх элементүүд нь өөр хоорондоо логик уялдаа холбоотой, нэг зорилгод чиглэсэн байх түвшин.],
    color: rgb("#0f766e") // Teal
  ),
  metric-box(
    "Холбоо хамаарал (Coupling)",
    "Гадаад хамаарал",
    [Модулиуд хоорондын хамаарал буюу бие даасан байдал, нэгнээсээ хамаарах түвшин.],
    color: rgb("#6d28d9") // Deep Purple
  )
)

== Кодын түвшний хэмжээсүүд

#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,
  [
    #block(
      fill: rgb("#f0fdf4"),
      stroke: (left: 4pt + rgb("#15803d")),
      inset: 12pt,
      radius: 6pt,
      width: 100%,
      [
        #text(weight: "bold", fill: rgb("#166534"), size: 1.1em)[Холстедийн хэмжээсүүд] \
        #v(4pt)
        *Юуг хэмжих:* Код дахь оператор ба операндуудын тоо @garmaa2025.
        
        #v(6pt)
        #align(center)[
          #block(
            fill: white,
            stroke: 0.5pt + rgb("#cbd5e1"),
            inset: 8pt,
            radius: 4pt,
            text(size: 0.85em, font: "Liberation Mono")[
              Хүндрэл: $D = (n_1 / 2) times (N_2 / n_2)$ \
              Эзлэхүүн: $V = N times log_2(n)$
            ]
          )
        ]
        
        #v(4pt)
        *Нөлөө:* Хүндрэл ($D$) өндөр байвал модуль ойлгоход хэцүү, нэгдмэл байдал муу байгааг илтгэнэ.
      ]
    )
  ],
  [
    #block(
      fill: rgb("#eff6ff"),
      stroke: (left: 4pt + rgb("#1d4ed8")),
      inset: 12pt,
      radius: 6pt,
      width: 100%,
      [
        #text(weight: "bold", fill: rgb("#1e40af"), size: 1.1em)[МакКейбийн хэмжээс] \
        #v(4pt)
        *Юуг хэмжих:* Удирдлагын урсгалын бие даасан замуудын тоо @garmaa2025.
        
        #v(6pt)
        #align(center)[
          #block(
            fill: white,
            stroke: 0.5pt + rgb("#cbd5e1"),
            inset: 8pt,
            radius: 4pt,
            text(size: 0.85em, font: "Liberation Mono")[
              Замын тоо: $M = E - V + 2P$ \
              Эсвэл: $M = d + 1$ \
              (шийдвэр гаргах цэг + 1)
            ]
          )
        ]
        
        #v(4pt)
        *Нөлөө:* Өндөр утга нь модулийн үүрэг хэт олон эсвэл салаалалт ($i f$, $w h i l e$) их байгааг илтгэнэ.
      ]
    )
  ]
)


= Чанарт үзүүлэх нөлөө

== Бусад чанарт хэрхэн нөлөөлдөг вэ?
#align(center)[
  #block(
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 8pt,
    inset: 6pt,
    fill: white,
    [#image("maintain.png", height: 75%)]
  )
]

== Бусад чанарт хэрхэн нөлөөлдөг вэ?

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,
  defbox([
    #text(weight: "bold", fill: rgb("#1e40af"))[Шинжлэгдэх байдал (Analyzability)] \
    #v(2pt)
    Бүхэл системийг бус, зөвхөн тухайн нэг модулийг бие даан шинжлэх, засварлах боломжтой.
  ]),
  defbox([
    #text(weight: "bold", fill: rgb("#1e40af"))[Дахин ашиглагдах байдал (Reusability)] \
    #v(2pt)
    Бие даасан модулиудыг өөр систем эсвэл контекстэд шууд дахин ашиглах боломжтой.
  ]),
  defbox([
    #text(weight: "bold", fill: rgb("#1e40af"))[Тестлэгдэх чадвар (Testability)] \
    #v(2pt)
    Модуль тус бүрийг бие даасан байдлаар тусад нь тестэлж, алдааг хурдан илрүүлэх боломжтой.
  ]),
  defbox([
    #text(weight: "bold", fill: rgb("#1e40af"))[Өөрчлөгдөх чадвар (Modifiability)] \
    #v(2pt)
    Нэг модульд хийсэн өөрчлөлт бусад хэсэгт нөлөөлөхгүй тул алдаа засах, сайжруулах ажил хялбаршина.
  ])
)


= Дүгнэлт

== Дүгнэлт

#grid(
  columns: (1.2fr, 1fr),
  gutter: 18pt,
  [
    #block(
      fill: rgb("#eff6ff"),
      stroke: (left: 4pt + rgb("#2563eb")),
      inset: 14pt,
      radius: 6pt,
      width: 100%,
      [
        #text(weight: "bold", fill: rgb("#1e40af"), size: 1.1em)[Тогтвортой байдал] \
        #v(4pt)
        Программ хангамж томорч, нарийн төвөгтэй болохын хэрээр модульчлал нь системийн тогтвортой байдлыг хангах гол хүчин зүйл болдог.
      ]
    )
    #v(12pt)
    #block(
      fill: rgb("#fef2f2"),
      stroke: (left: 4pt + rgb("#ef4444")),
      inset: 14pt,
      radius: 6pt,
      width: 100%,
      [
        #text(weight: "bold", fill: rgb("#b91c1c"), size: 1.1em)[Эцсийн үр дүн] \
        #v(4pt)
        Модульчлал нь программ хангамжийн урт хугацааны, тогтвортой бөгөөд үр ашигтай хөгжүүлэлтийн хамгийн суурь зарчим мөн.
      ]
    )
  ],
  [
    #block(
      fill: rgb("#f0fdf4"),
      stroke: (left: 4pt + rgb("#22c55e")),
      inset: 14pt,
      radius: 6pt,
      width: 100%,
      height: 100%,
      [
        #text(weight: "bold", fill: rgb("#15803d"), size: 1.1em)[Суурь давуу талууд] \
        #v(6pt)
        Системийг бие даасан модулиудад зөв хуваах нь дараах процессуудыг үлэмж хялбарчилдаг:
        
        #v(8pt)
        - *Засварлах чадвар*
        - *Тестлэгдэх чадвар*
        - *Шинэчлэх, өргөтгөх*
        - *Дахин ашиглах*
      ]
    )
  ]
)


= Ашигласан эх сурвалж

== Ашигласан эх сурвалж

#set text(size: 0.72em)
#bibliography("refs.bib", title: none, style: "ieee", full: true)