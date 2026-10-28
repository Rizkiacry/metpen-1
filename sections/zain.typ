// sections/zain.typ — Zain Akbar Rizkia's sheet data
#import "../config.typ": form

#let zain = form((
  name: "ZAIN AKBAR RIZKIA",
  nim: "202531091",
  kelas: "C1",
  // row borders
  ys: (178.45pt, 219.25pt, 314.05pt, 396.15pt, 533.15pt, 628.0pt, 713.05pt, 766.45pt),
  // answer Y positions
  ay: (tema: 28.0pt, tujuan: 27.0pt, gap: 14.3pt, lit: 27.5pt, novelty: 27.0pt, metode: 26.5pt, judul: 27.0pt),
  tracking: 0pt,
  gap-spc: 3pt,

  tema: [Performa WebAssembly sebagai bytecode tingkat rendah modern pada komputasi murni.],

  tujuan: [Mengukur dan membandingkan waktu eksekusi serta penggunaan memori kernel komputasi dasar (pengurutan, perkalian matriks, hash) pada WebAssembly tulisan tangan (WAT) dan hasil kompilasi Zig, dengan JavaScript sebagai pembanding. Kontribusinya adalah data empiris berbahasa Indonesia tentang kapan pemrograman tingkat rendah modern layak dipakai.],

  gap: [Kajian WebAssembly di Indonesia umumnya menguji pemrosesan gambar, memakai Rust, dan melibatkan server serta jaringan (Assardew & Suartana, 2026), sehingga kinerja bytecode tingkat rendah itu sendiri belum terisolasi. Studi internasional juga melaporkan selisih kinerja yang bergantung pada beban kerja (Jangda dkk., 2019).],

  lit: [
    1. Assardew, A. M. L. A., & Suartana, I. M. (2026). Perbandingan Arsitektur Runtime WebAssembly dan Native Code pada Pengembangan Website. _JINACS_, 7(3), 646--652. https://ejournal.unesa.ac.id/index.php/jinacs/article/view/75992

    2. Maulana, A., Putri, A., Syakir, M. A. F., Saputra, R. S., & Lestari, M. D. (2025). RISC vs CISC: Studi Kinerja dan Efisiensi dalam Organisasi Arsitektur Komputer. _Jupiter_, 3(4), 157--171. https://doi.org/10.61132/jupiter.v3i4.973

    3. Pujiono, I. P., Trianto, R. B., & Hana, F. M. (2024). Perbandingan Efisiensi Memori dan Waktu Komputasi pada 7 Algoritma Sorting Menggunakan Bahasa Pemrograman Java. _Jurnal Sistem Informasi dan Sistem Komputer (SIMKOM)_. http://e-jurnal.stmikbinsa.ac.id/index.php/simkom/article/download/481/107
  ],
  refs: none,

  novelty: [Penelitian terdahulu memakai gambar, Rust, dan server; penelitian ini mengisolasi kernel komputasi murni tanpa DOM, jaringan, maupun aplikasi. Kebaruannya adalah pembanding tiga lapis (JavaScript, Zig ke Wasm, dan WAT tulisan tangan) beserta ukuran modul dan memori linear, sebagai dasar kuantitatif pemilihan teknologi tingkat rendah.],

  metode: [Eksperimen kuantitatif: tiap kernel dibuat dalam tiga versi dan dijalankan di Node.js (V8) dengan 5 kali pemanasan serta 30 kali pengulangan pada data 10#super[3] sampai 10#super[6]. Data berupa waktu performance.now(), ukuran berkas .wasm, dan halaman memori linear, dianalisis dengan rata-rata, simpangan baku, uji Mann-Whitney, dan rasio percepatan.],

  judul: [Analisis Komparatif Waktu Eksekusi dan Penggunaan Memori Kernel Komputasi pada WebAssembly Tulisan Tangan (WAT), Zig, dan JavaScript],
))
