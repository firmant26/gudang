import 'abstractClassBarang.dart';

class BarangMudahKadaluarsa extends Barang {
  String? tanggalKadaluarsa;
  // Konstruktor
  BarangMudahKadaluarsa({
    super.kodeBarang,
    super.namaBarang,
    super.jumlahBarangDidalam,
    super.satuan,
    super.tanggalBeli,
    super.hargaBeli,
    super.tanggalJual,
    super.hargaJual,
    String? tanggalKadaluarsa
  }) {
     if (tanggalKadaluarsa != "0") {
      try {
        DateTime cekTanggalKadaluarsa = DateTime.parse(tanggalKadaluarsa!);
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

  }
 
  bool apakahSudahkadaluarsa() {
    //mengecek apakah barang ini sudah kadaluarsa atau belum
    return false;
  }
  
  @override
  bool editBarang(String namaBarang, int jumlahBarangDidalam, String satuan, String tanggalBeli, double hargaBeli, double hargaJual, [String? tanggalKadaluarsa]) {
    this.namaBarang  = namaBarang;
    this.jumlahBarangDidalam = jumlahBarangDidalam;
    this.satuan = satuan;
    this.tanggalBeli = tanggalBeli;
    this.hargaBeli = hargaBeli;
    this.hargaJual = hargaJual;
    this.tanggalKadaluarsa = tanggalKadaluarsa;
    return true;
  }
  

}
