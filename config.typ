// config.typ — shared helpers and the form builder
// NOTE: set rules must live inside form() so they apply at the call site
// (module-level #set only affects code evaluated within this module).

#let gray = luma(51)
#let dots = "…" * 37 + "..."
#let W = 415.9pt   // text width inside right column

// absolute placement on the page
#let at(x, y, body) = place(top + left, dx: x, dy: y, body)

// ---- right column helpers (positions relative to cell origin) ----
#let X = 5.35pt
#let pl(y, body) = place(top + left, dx: X, dy: y, body)

// italic prompt line, 11pt, optionally justified (wrapped line)
#let prompt(y, body, j: false, col: gray) = pl(y, box(width: W,
  text(size: 11pt, style: "italic", fill: col, tracking: if j { -0.05pt } else { 0pt })[#body#if j { linebreak(justify: true) }]))

// answer text: upright black, justified, fills the dotted-line area
#let ans(y, body, size: 11pt, lead: 2.8pt, gap: 3pt, tracking: 0pt) = pl(y, block(width: W, {
  set par(justify: true, leading: lead, spacing: gap)
  text(size: size, fill: black, style: "normal", tracking: tracking)[#body]
}))

// italic dotted filler line
#let dl(y, pre: none) = pl(y, text(size: 12pt, style: "italic", fill: gray)[#dots])
#let nl(y, n) = pl(y, text(size: 12pt, style: "italic")[#n. #text(fill: gray)[#dots]])

// small reference entry (literature review)
#let refl(y, t) = pl(y, box(width: W, par(justify: false, leading: 0.5pt, text(size: 8pt, fill: black, t))))

// bold label, centred in left column
#let lab(y, body) = place(top + center, dy: y, text(weight: "bold", size: 12pt, body))

// ---- page header ----
#let header(d) = {
  at(0pt, 33.9pt, box(width: 612pt, align(center,
    text(weight: "bold", size: 16pt, underline(offset: 0pt, stroke: 1.6pt, extent: 0pt)[PENENTUAN AREA PENELITIAN]))))
  at(72pt, 61.5pt, text(size: 14pt, tracking: -0.075pt)[Tugas dalam penentuan *Tema, Tujuan, Masalah/Gap, Literature Review, Novelty,*])
  at(72pt, 78.8pt, text(size: 14pt)[*Metode* dan *Judul*.])
  for (y, t) in ((104.2pt, [Nama: #d.name]), (129.5pt, [NIM: #d.nim]), (155.0pt, [Kelas: #d.kelas])) {
    at(72pt, y, text(size: 14pt, weight: "bold")[#t])
  }
}

// ---- form builder ----
// d = dictionary with: name, nim, kelas, ys (row borders), ay (answer Y positions),
// tracking, gap-spc, and content: tema, tujuan, gap, lit (paragraph) or refs (array),
// lit-pitch (ref line spacing), novelty, metode, judul
#let form(d) = {
  set page(paper: "us-letter", margin: 0pt)
  set text(font: "Times New Roman", size: 12pt, lang: "id", overhang: false,
    top-edge: 0.786em, bottom-edge: "descender", fill: black)
  set par(leading: 0pt, spacing: 0pt, justify: false)

  header(d)
  let hs = range(7).map(i => d.ys.at(i + 1) - d.ys.at(i))
  at(72.25pt, d.ys.at(0), table(
    columns: (80.2pt, 426.7pt),
    rows: hs,
    inset: 0pt,
    stroke: 0.5pt + black,
    align: top + left,

    // 1 Tema/Topik
    lab(1.9pt)[Tema/Topik],
    { prompt(1.75pt)[Tentukan topik penelitian~ dan relevan dengan bidang studi Ilmu Komputer.]
      ans(d.ay.tema, d.tema, tracking: d.tracking, gap: d.gap-spc) },

    // 2 Tujuan
    lab(2.00pt)[Tujuan],
    { prompt(1.75pt, j: true)[Tentukan apa yang ingin Anda capai dengan riset Anda dan kontribusi penelitian terhadap]
      prompt(14.35pt)[bidang studi ilmu komputer]
      ans(d.ay.tujuan, d.tujuan, tracking: d.tracking, gap: d.gap-spc) },

    // 3 Masalah/Gap
    lab(1.85pt)[Masalah/Gap],
    { prompt(1.85pt)[Jelaskan mengapa masalah tersebut penting dan relevan untuk diteliti.]
      ans(d.ay.gap, d.gap, tracking: d.tracking, gap: d.gap-spc) },

    // 4 Literature Review
    { lab(2.05pt)[Literature]
      lab(14.55pt)[Review] },
    { pl(1.85pt, box(width: W, text(size: 11pt, style: "italic", tracking: -0.075pt)[Berikan minimal 3 (tiga#text(weight: "bold")[) artikel dari jurnal bereputasi], berkaitan dengan tema anda. (Judul,#linebreak(justify: true)]))
      prompt(14.55pt, col: black)[penulis, link paper)]
      if d.refs != none {
        for (i, r) in d.refs.enumerate() {
          refl(d.ay.lit + i * d.lit-pitch, [#(i + 1)\. #r])
        }
      } else {
        ans(d.ay.lit, d.lit, size: 9pt, lead: 2.2pt, tracking: d.tracking)
      } },

    // 5 Novelty
    lab(2.05pt)[Novelty],
    { prompt(1.85pt, j: true)[Apa yang membuat penelitian Anda berbeda dari penelitian sebelumnya dan bagaimana hal]
      prompt(14.55pt)[itu dapat memberikan kontribusi baru pada bidang studi ilmu komputer]
      ans(d.ay.novelty, d.novelty, tracking: d.tracking, gap: d.gap-spc) },

    // 6 Metode
    lab(1.95pt)[Metode],
    { prompt(1.75pt, j: true)[Jelaskan mengapa metode tersebut sesuai dengan penelitian dan bagaimana Anda akan]
      prompt(14.45pt)[mengumpulkan data.]
      ans(d.ay.metode, d.metode, tracking: d.tracking, gap: d.gap-spc) },

    // 7 Judul
    lab(1.95pt)[Judul],
    { prompt(1.75pt, j: true)[Berdasarkan rangkuman dari enam kolom sebelumnya, buatlah judul riset yang informatif dan]
      prompt(14.45pt)[mencerminkan esensi dari penelitian Anda.]
      ans(d.ay.judul, d.judul, tracking: d.tracking, gap: d.gap-spc) },
  ))
}
