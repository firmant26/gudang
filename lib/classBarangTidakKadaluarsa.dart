import 'abstractClassBarang.dart';

class BarangTidakKadaluarsa extends Barang {
  // Konstruktor dengan named parameters
  BarangTidakKadaluarsa({
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
  bool editBarang(String namaBarang, int jumlahBarangDidalam, String satuan, String tanggalBeli, double hargaBeli, double hargaJual, [String? tanggalKadaluarsa]) {
    this.namaBarang  = namaBarang;
    this.jumlahBarangDidalam = jumlahBarangDidalam;
    this.satuan = satuan;
    this.tanggalBeli = tanggalBeli;
    this.hargaBeli = hargaBeli;
    this.hargaJual = hargaJual;
    return true;
  }
 
 
  
}
