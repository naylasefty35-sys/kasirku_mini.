import 'models/models.dart';
void main() {

  final List<Produk> katalog = [
    ProdukMakanan.restok('MKN001', 'Nasi Goreng', 15000, 10),
    ProdukMinuman.restok('MNM001', 'Es Teh Manis', 5000, 20),
  ];
  for (final produk in katalog) {
    // Menggabungkan tampilan nama, stok, dan pajak sekaligus
    print('${produk.nama}: stok ${produk.stok} | pajak Rp${produk.hitungPajak()}');
  }

  final kategoriUnik = <String>{};
  kategoriUnik.add('Makanan Berat');
  kategoriUnik.add('Minuman Dingin');
  kategoriUnik.add('Makanan Berat'); // duplikat, akan diabaikan
  print(kategoriUnik); // hanya 2 elemen


  print('Daftar Kategori: $kategoriUnik');
}