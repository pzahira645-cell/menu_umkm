import 'package:material_ui/material_ui.dart';

void main() => runApp(const MenuUmkmApp());

// ============================================================
// 1. TEMA: warna dari satu "seed", plus mode gelap
// ============================================================
class MenuUmkmApp extends StatelessWidget {
  const MenuUmkmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu UMKM Kuliner',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 196, 255, 34)),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 196, 255, 34),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system, // gelap/terang ikut pengaturan HP
      home: const HalamanMenu(),
    );
  }
}

// ============================================================
// 2. HALAMAN UTAMA: Scaffold -> AppBar + ListView
// ============================================================
class HalamanMenu extends StatelessWidget {
  const HalamanMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu UMKM Kuliner')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          HeaderUmkm(),
          SizedBox(height: 16),
          KartuKontak(),
          SizedBox(height: 16),
          KartuMenu(
            nama: 'Mie Gomak',
            harga: 'Rp 20.000',
            kategori: 'Makanan Berat',
          ),
          KartuMenu(
            nama: 'Bika Ambon',
            harga: 'Rp 35.000',
            kategori: 'Kue',
          ),
          KartuMenu(
            nama: 'Es Teh Manis',
            harga: 'Rp 5.000',
            kategori: 'Minuman',
          ),
          KartuMenu(
            nama: 'Lontong Medan',
            harga: 'Rp 15.000',
            kategori: 'Sarapan',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 3. HEADER: gambar (ikon bulat) + nama usaha
// ============================================================
class HeaderUmkm extends StatelessWidget {
  const HeaderUmkm({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: tema.colorScheme.primaryContainer,
          child: Icon(
            Icons.restaurant,
            size: 48,
            color: tema.colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: 12),
        Text('Kedai Jaijung', style: tema.textTheme.headlineSmall),
        Text('Masakan khas Medan', style: tema.textTheme.bodyMedium),
      ],
    );
  }
}

// ============================================================
// 4. KARTU KONTAK: Card berisi 3 ListTile
// ============================================================
class KartuKontak extends StatelessWidget {
  const KartuKontak({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('0858-3125-6022'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Jl. Willem Iskandar, Medan'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Buka 08.00 - 17.00'),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 5. KARTU MENU (STATELESS): data tidak berubah sendiri
// ============================================================
class KartuMenu extends StatelessWidget {
  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  final String nama;
  final String harga;
  final String kategori;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama, style: tema.textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(harga, style: tema.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Chip(label: Text(kategori)),
                ],
              ),
            ),
            TombolFavorit(namaMenu: nama),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 6. TOMBOL FAVORIT (STATEFUL): hatinya bisa berubah
// ============================================================
class TombolFavorit extends StatefulWidget {
  const TombolFavorit({super.key, required this.namaMenu});

  final String namaMenu;

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _favorit = false;

  void _tekan() {
    setState(() => _favorit = !_favorit);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _favorit
              ? '${widget.namaMenu} masuk favorit'
              : '${widget.namaMenu} dihapus dari favorit',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _tekan,
      color: Theme.of(context).colorScheme.primary,
      icon: Icon(_favorit ? Icons.favorite : Icons.favorite_border),
    );
  }
}