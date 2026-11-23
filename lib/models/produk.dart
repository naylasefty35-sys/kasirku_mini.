
class Produk {
  final String kode;
  String nama;
  String kategori;
  double harga;
  int stok;
  bool tersedia;

  // Constructor utama
  Produk(this.kode, this.nama, this.kategori, this.harga, this.stok)
      : tersedia = stok > 0;

  // Named constructor: produk baru tanpa stok
  Produk.baru(String kode, String nama, String kategori, double harga)
      : this(kode, nama, kategori, harga, 0);

  // Named constructor: produk dengan stok awal
  Produk.restok(
      String kode,
      String nama,
      String kategori,
      double harga,
      int stokAwal,
      ) : this(kode, nama, kategori, harga, stokAwal);

  // Positional parameter
  String tampilkanInfo(String prefix) =>
      '$prefix $nama - Rp${harga.toStringAsFixed(0)}';

  // Method untuk menghitung pajak 11%
  double hitungPajak() {
    return harga * 0.11;
  }

  // Optional positional parameter
  void tambahStok(int jumlah, [String? catatan]) {
    stok += jumlah;
    tersedia = stok > 0;

    if (catatan != null) {
      print('Catatan restok: $catatan');
    }
  }

  // Named parameter wajib dan opsional
  void aturDiskon({required double persen, String? alasan}) {
    final potongan = harga * persen / 100;
    harga -= potongan;

    print(
      'Diskon $persen% diterapkan'
          '${alasan != null ? ' ($alasan)' : ''}',
    );
  }

  // Optional named parameter dengan nilai default
  String cetakStruk({bool includeDiskon = false}) {
    final buffer = StringBuffer()
      ..writeln('$nama ($kategori)')
      ..writeln('Harga: Rp${harga.toStringAsFixed(0)}')
      ..writeln('Stok tersisa: $stok')
      ..writeln('Tersedia: ${tersedia ? "Ya" : "Tidak"}');

    return buffer.toString();
  }
}

void main() {
  final produk = Produk(
    'P001',
    'Laptop',
    'Elektronik',
    5000000,
    10,
  );

  print(produk.tampilkanInfo('Produk:'));

  produk.tambahStok(5, 'Restok barang baru');

  produk.aturDiskon(persen: 10, alasan: 'Promo');

  print('Pajak: Rp${produk.hitungPajak().toStringAsFixed(0)}');

  print(produk.cetakStruk());
}
