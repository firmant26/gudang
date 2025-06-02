abstract class Barang {
  String? kodeBarang;
  String? namaBarang;
// kalau 1 kardus
  int? jumlahBarangDidalam;
  String? satuan;
  String? tanggalBeli;
  double? hargaBeli;
  String? tanggalJual;
  double? hargaJual;

  Barang({
    this.kodeBarang,
    this.namaBarang,
    this.jumlahBarangDidalam,
    this.satuan,
    this.tanggalBeli,
    this.hargaBeli,
    this.tanggalJual,
    this.hargaJual,
  });

  double jualBarang(double nominal);
}
