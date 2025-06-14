import 'abstractClassBarang.dart';

class BarangMudahKadaluarsa extends Barang {
  // Konstruktor
  BarangMudahKadaluarsa({
    required super.kodeBarang,
    required super.namaBarang,
    required super.jumlahBarangDidalam,
    required super.satuan,
    required super.tanggalBeli,
    required super.hargaBeli,
    required super.tanggalJual,
    required super.hargaJual,
    required super.tanggalKadaluarsa
  });
 
  bool apakahSudahkadaluarsa() {
    //mengecek apakah barang ini sudah kadaluarsa atau belum
    return false;
  }
  
  @override
  bool editBarang(String namaBarang, int jumlahBarangDidalam, String satuan, String tanggalBeli, double hargaBeli, double hargaJual, String tanggalKadaluarsa) {
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
