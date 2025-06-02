import 'abstractClassBarang.dart';

class BarangMudahKadaluarsa extends Barang {
  String? tanggalKadaluarsa;

  // Konstruktor
  BarangMudahKadaluarsa({
    this.tanggalKadaluarsa,
    super.kodeBarang,
    super.namaBarang,
    super.jumlahBarangDidalam,
    super.satuan,
    super.tanggalBeli,
    super.hargaBeli,
    super.tanggalJual,
    super.hargaJual,
  });

  @override
  double jualBarang(double nominal) {
    double kembalian = 0;
    if (apakahSudahkadaluarsa()) {
      // Jika barang sudah kadaluarsa, tidak bisa dijual
    } else {
      // Jika barang belum kadaluarsa, proses penjualan, proses jual barang
    }
    return kembalian;
  }

  bool apakahKodeBarangAda(String kodeBarang) {
    // Mengecek apakah kode barang ada
    if (kodeBarang == null) {}
    return this.kodeBarang == kodeBarang;
  }

  bool apakahSudahkadaluarsa() {
    //mengecek apakah barang ini sudah kadaluarsa atau belum
    return false;
  }
}
