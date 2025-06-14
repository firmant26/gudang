import 'abstractClassBarang.dart';

class BarangTidakKadaluarsa extends Barang {
  // Konstruktor dengan named parameters
  BarangTidakKadaluarsa({
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
