import 'classBarangMudahKadaluarsa.dart';
import 'classBarangTidakKadaluarsa.dart';
import 'doubleLinkedList.dart';
import 'stack.dart';
import 'queue.dart';

void main() {
  BarangMudahKadaluarsa mieInstan = BarangMudahKadaluarsa(
      kodeBarang: "A35",
      namaBarang: "Mie Instan",
      jumlahBarangDidalam: 40,
      satuan: "bungkus",
      tanggalBeli: "20-5-2025",
      hargaBeli: 100000,
      hargaJual: 120000);
  BarangMudahKadaluarsa indoMie = BarangMudahKadaluarsa(
      kodeBarang: "A35",
      namaBarang: "IndoMie",
      jumlahBarangDidalam: 40,
      satuan: "bungkus",
      tanggalBeli: "20-5-2025",
      hargaBeli: 100000,
      hargaJual: 120000);
  BarangTidakKadaluarsa kipasAngin = BarangTidakKadaluarsa(
      kodeBarang: "S35",
      namaBarang: "Kipas Angin",
      jumlahBarangDidalam: 1,
      satuan: "unit",
      tanggalBeli: "20-5-2025",
      hargaBeli: 150000,
      hargaJual: 180000);
  BarangTidakKadaluarsa kipasAngin2 = BarangTidakKadaluarsa(
      kodeBarang: "S35",
      namaBarang: "Kipas Angin",
      jumlahBarangDidalam: 1,
      satuan: "unit",
      tanggalBeli: "20-5-2025",
      hargaBeli: 150000,
      hargaJual: 180000);

  DoubleLinkedListBarang gudang = DoubleLinkedListBarang();
  Queque kotak1 = Queque(100);
  Stack kotak2 = Stack(100);

  // Cek dan tambah indoMie
  if (!gudang.findKodeBarang(indoMie.kodeBarang!)) {
    gudang.tambahDepan(indoMie);
    if (indoMie is BarangMudahKadaluarsa) {
      kotak1.enqueque(indoMie.kodeBarang);
    } else if (indoMie is BarangTidakKadaluarsa) {
      kotak2.push(indoMie.kodeBarang);
    }
  } else {
    print("Kode barang ${indoMie.kodeBarang} sudah ada, tidak boleh duplikat!");
  }

  // Cek dan tambah mieInstan
  if (!gudang.findKodeBarang(mieInstan.kodeBarang!)) {
    gudang.tambahDepan(mieInstan);
    if (mieInstan is BarangMudahKadaluarsa) {
      kotak1.enqueque(mieInstan.kodeBarang);
    } else if (mieInstan is BarangTidakKadaluarsa) {
      kotak2.push(mieInstan.kodeBarang);
    }
  } else {
    print("Kode barang ${mieInstan.kodeBarang} sudah ada, tidak boleh duplikat!");
  }

  // Cek dan tambah kipasAngin
  if (!gudang.findKodeBarang(kipasAngin.kodeBarang!)) {
    gudang.tambahDepan(kipasAngin);
    if (kipasAngin is BarangMudahKadaluarsa) {
      kotak1.enqueque(kipasAngin.kodeBarang);
    } else if (kipasAngin is BarangTidakKadaluarsa) {
      kotak2.push(kipasAngin.kodeBarang);
    }
  } else {
    print("Kode barang ${kipasAngin.kodeBarang} sudah ada, tidak boleh duplikat!");
  }

    // Cek dan tambah kipasAngin
  if (!gudang.findKodeBarang(kipasAngin2.kodeBarang!)) {
    gudang.tambahDepan(kipasAngin2);
    if (kipasAngin2 is BarangMudahKadaluarsa) {
      kotak1.enqueque(kipasAngin2.kodeBarang);
    } else if (kipasAngin2 is BarangTidakKadaluarsa) {
      kotak2.push(kipasAngin2.kodeBarang);
    }
  } else {
    print("Kode barang ${kipasAngin2.kodeBarang} sudah ada, tidak boleh duplikat!");
  }

  kotak1.printQueue();
  kotak2.printStack();
}



// void main() {
//   // Membuat double linked list untuk semua barang
//   DoubleLinkedListBarang daftarBarang = DoubleLinkedListBarang();

//   // Menambahkan barang mudah kadaluarsa
//   var barangMudah = BarangMudahKadaluarsa(
//     kodeBarang: 101,
//     namaBarang: "Susu UHT",
//     jumlahBarangDidalam: 10,
//     satuan: "Kotak",
//     tanggalBeli: "2025-05-01",
//     hargaBeli: 12000,
//     tanggalJual: null,
//     hargaJual: 15000,
//     tanggalKadaluarsa: "2025-06-01",
//   );
//   daftarBarang.tambahBelakang(barangMudah);

//   // Menambahkan barang tidak mudah kadaluarsa
//   var barangTidakMudah = BarangTidakKadaluarsa(
//     kodeBarang: 201,
//     namaBarang: "Sapu",
//     jumlahBarangDidalam: 20,
//     satuan: "Kg",
//     tanggalBeli: "",
//     hargaBeli: 14000,
//     tanggalJual: null,
//     hargaJual: 18000,
//   );
//   daftarBarang.tambahBelakang(barangTidakMudah);

//   // Tampilkan semua barang dari depan
//   print("=== Daftar Barang dari Depan ===");
//   daftarBarang.tampilkanDariDepan();

//   // Tampilkan detail barang berdasarkan kode
//   print("\n=== Lihat Detail Barang ===");
//   daftarBarang.lihatBarang(101);
//   daftarBarang.lihatBarang(201);

//   // Contoh penggunaan Stack untuk barang tidak mudah kadaluarsa
//   Stack stackBarang = Stack(5);
//   stackBarang.push(barangTidakMudah);
//   print("\n=== Isi Stack Barang Tidak Mudah Kadaluarsa ===");
//   stackBarang.printStack(); // pastikan method ini ada di Stack
// }