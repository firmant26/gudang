abstract class Barang {
  String? kodeBarang;
  String? namaBarang;
  int? jumlahBarangDidalam;
  String? satuan;
  String? tanggalBeli;
  double? hargaBeli;
  String? tanggalJual;
  double? hargaJual;
  String? tanggalKadaluarsa = "0"; // Default value for non-expiring items

  Barang(
      {this.kodeBarang,
      this.namaBarang,
      int? jumlahBarangDidalam,
      this.satuan,
      String? tanggalBeli,
      double? hargaBeli,
      this.tanggalJual,
      double? hargaJual}) {
    if (tanggalBeli != "0") {
      try {
        DateTime cekTanggalBeli = DateTime.parse(tanggalBeli!);

        if (cekTanggalBeli != null &&
            cekTanggalBeli.isBefore(DateTime.now().add(Duration(days: 1)))) {
          this.tanggalBeli = tanggalBeli;
        } else {
          print("Tanggal Beli tidak valid!");
          throw FormatException("Tanggal Beli tidak vallid!");
        }
      } catch (e) {
        throw FormatException("Format tanggal tidak valid!");
      }
    } else {
      throw FormatException("Format tanggal tidak valid!");
    }

    if (hargaBeli! > 0 && hargaJual! > 0) {
      this.hargaBeli = hargaBeli;
      this.hargaJual = hargaJual;
    } else {
      throw FormatException("Format harga tidak valid!");
    }

    if (jumlahBarangDidalam! >= 1) {
      this.jumlahBarangDidalam = jumlahBarangDidalam;
    } else {
      throw FormatException("Jumlah barang tidak valid!");
    }
  }
  bool editBarang(String namaBarang, int jumlahBarangDidalam, String satuan,
      String tanggalBeli, double hargaBeli, double hargaJual,
      [String tanggalKadaluarsa]);
}
