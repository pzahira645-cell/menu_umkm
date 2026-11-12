# Menu UMKM Kuliner

Aplikasi Flutter sederhana untuk Tugas Rutin 5, Pemrograman Mobile.

## Diagram Widget Tree

MaterialApp(theme, darkTheme)
└─ Scaffold
   ├─ AppBar
   └─ ListView
      ├─ HeaderUmkm (gambar, nama)
      ├─ KartuKontak (ListTile x3)
      └─ KartuMenu x4 (Stateless)
         └─ TombolFavorit (Stateful)

## Penjelasan Tiga Pohon

- Widget tree: daftar "resep/konfigurasi" tampilan. Murah dan dibuat ulang
  setiap `build()` dipanggil.
- Element tree: penghubung yang bertahan lama. State dan BuildContext
  hidup di sini, jadi hati favorit tidak hilang walau widget dibuat ulang.
- RenderObject tree: bagian yang menghitung ukuran, posisi, dan
  menggambar di layar (layout dan paint).

## Pilihan Stateless / Stateful

- `KartuMenu`, `HeaderUmkm`, `KartuKontak` = Stateless, karena datanya
  tidak berubah sendiri.
- `TombolFavorit` = Stateful, karena status favorit berubah saat
  ditekan. Hanya bagian kecil ini yang Stateful supaya kode tetap ringan.

## Cara Menjalankan

flutter pub get
flutter run
flutter test