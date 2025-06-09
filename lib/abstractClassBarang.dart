abstract class Barang {
  String? kodeBarang;
  String? namaBarang;
  int? jumlahBarangDidalam;
  String? satuan;
  String? tanggalBeli;
  double? hargaBeli;
  String? tanggalJual;
  double? hargaJual;
  String? tanggalKadaluarsa;

  Barang({required this.kodeBarang, required this.namaBarang, required this.jumlahBarangDidalam, required this.satuan, required String tanggalBeli, required double hargaBeli, required this.tanggalJual, required double hargaJual, required String tanggalKadaluarsa}) 
  {
    if (tanggalKadaluarsa != "0") {
      try {
        DateTime cekTanggalKadaluarsa = DateTime.parse(tanggalKadaluarsa);
        if (cekTanggalKadaluarsa != null && cekTanggalKadaluarsa.isAfter(DateTime.now())) {
          this.tanggalKadaluarsa = tanggalKadaluarsa;
        } else {
          print("Tanggal Kadaluarsa tidak valid!");
          throw FormatException("Tanggal Kadaluarsa tidak valid!");
        }
      } catch (e) {
        throw FormatException("Format tanggal tidak valid!");
      }
    } else {
      this.tanggalKadaluarsa = "0";
    }

    if (tanggalBeli != "0") {
      try {
        DateTime cekTanggalBeli = DateTime.parse(tanggalBeli);

        if(cekTanggalBeli != null && cekTanggalBeli.isBefore(DateTime.now().add(Duration(days: 1)))) {
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

    if (hargaBeli > 0 && hargaJual > 0) {
      this.hargaBeli = hargaBeli;
      this.hargaJual = hargaJual;
    } else {
      throw FormatException("Format harga tidak valid!");
    }

  }
  bool editBarang(String namaBarang, int jumlahBarangDidalam, String satuan, String tanggalBeli, double hargaBeli, double hargaJual, String tanggalKadaluarsa);
}
