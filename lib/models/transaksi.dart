
import 'item_transaksi.dart';
import 'produk.dart';
import 'bisa_dicetak.dart';

class Transaksi implements BisaDicetak {
  final String idTransaksi;
  final List<ItemTransaksi> _items = [];

  Transaksi(this.idTransaksi);

  // Menambahkan item transaksi
  void tambahItem(Produk produk, int jumlah) {
    _items.add(ItemTransaksi(produk, jumlah));
  }

  // Getter daftar item
  List<ItemTransaksi> get items => List.unmodifiable(_items);

  // Getter total harga
  double get totalHarga =>
      _items.fold(0.0, (sum, item) => sum + item.subtotal);

  // Implementasi method cetakStruk dari BisaDicetak
  @override
  String cetakStruk() {
    final buffer = StringBuffer()
      ..writeln('=== STRUK: $idTransaksi ===');

    for (final item in _items) {
      buffer.writeln(
        '${item.produk.nama} x${item.jumlah} = '
            'Rp${item.subtotal.toStringAsFixed(0)}',
      );
    }

    buffer.writeln('TOTAL: Rp${totalHarga.toStringAsFixed(0)}');

    return buffer.toString();
  }
}
