// sections/hasbi.typ — Muh. Hasbi Taslim's sheet data
#import "../config.typ": form

#let hasbi = form((
  name: "MUH. HASBI TASLIM",
  nim: "202531062",
  kelas: "B1",
  // row borders
  ys: (178.45pt, 219.25pt, 314.05pt, 396.15pt, 477.15pt, 572.0pt, 653.05pt, 706.45pt),
  // answer Y positions
  ay: (tema: 28.55pt, tujuan: 27.35pt, gap: 14.65pt, lit: 28.5pt, novelty: 27.35pt, metode: 27.25pt, judul: 27.25pt),
  tracking: -0.05pt,
  gap-spc: 0pt,

  tema: [Perbandingan kinerja query MySQL dan PostgreSQL pada basis data relasional.],

  tujuan: [Mengukur dan membandingkan waktu eksekusi query (insert, select, update, delete, dan join) pada MySQL dan PostgreSQL dengan jumlah data yang bervariasi, lalu menentukan DBMS yang lebih sesuai untuk tiap jenis beban kerja. Kontribusinya berupa bukti empiris yang dapat menjadi acuan pemilihan DBMS di bidang basis data.],

  gap: [Pemilihan DBMS memengaruhi kecepatan sistem, namun hasil penelitian terdahulu belum seragam menurut jenis query. Penelitian yang ada juga memakai versi lama (misalnya MySQL 5.7 dan PostgreSQL 9.6) dan tidak berfokus pada pengaruh indeks, sehingga masih ada celah untuk diteliti.],

  lit: none,
  lit-pitch: 17.3pt,
  refs: (
    "Studi Perbandingan Performansi Antara MySQL dan PostgreSQL. Praba, A. D. & Safitri, M. (2020). Jurnal Khatulistiwa Informatika. https://doi.org/10.31294/jki.v8i2.8851",
    "Analisis Perbandingan Kinerja Query DBMS Antara MySQL 5.7.16 dan MariaDB 10.1. Warman, I. & Ramdaniansyah, R. (2018). Jurnal TEKNOIF. https://doi.org/10.21063/JTIF.2018.V6.1.32-41",
    "Analisis Perbandingan Performa Waktu Respons Kueri Antara MySQL PHP 7.4.2, PostgreSQL, dan MongoDB. Winata, R. H. & Putra, Y. Y. (2021). Prosiding SITASI. https://sitasi.upnjatim.ac.id/index.php/sitasi/article/download/36/6",
  ),

  novelty: [Berbeda dari penelitian terdahulu, pengujian memakai versi terbaru kedua DBMS, data hingga 1 juta record, serta membandingkan query dengan dan tanpa indeks. Kebaruannya: menunjukkan seberapa besar indeks mengubah selisih kinerja kedua DBMS, sehingga hasilnya lebih berguna bagi praktik.],

  metode: [Eksperimen kuantitatif: kedua DBMS dipasang pada satu komputer dengan data sintetis identik (50 ribu, 100 ribu, 1 juta record). Setiap query dijalankan 5 kali, waktu eksekusi dicatat dari EXPLAIN ANALYZE lalu dirata-rata. Cocok karena hasilnya berupa angka yang bisa dibandingkan langsung.],

  judul: [Analisis Perbandingan Kinerja Query MySQL dan PostgreSQL pada Data Skala Besar dengan dan tanpa Indeks],
))
