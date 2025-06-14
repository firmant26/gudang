import 'package:tugas_1/abstractClassBarang.dart';
import 'package:tugas_1/classBarangMudahKadaluarsa.dart';
import 'package:tugas_1/classBarangTidakKadaluarsa.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

bool tambahDataDummyRak1(
    DoubleLinkedListBarang stok, Map<String, Stack> rak1, Barang barang) {
  bool statusAdd = stok.tambahBelakang(barang);
  if (statusAdd == false) {
    print("---");
    print("Pesan Error: Kode barang sudah ada!");
    print("---");
    return false;
  }
  if (rak1.containsKey(barang.namaBarang) == true) {
    rak1[barang.namaBarang]!.push(barang);
  } else if (rak1.containsKey(barang.namaBarang) == false) {
    Stack newStack = Stack(100);
    newStack.push(barang);
    rak1[barang.namaBarang!] = newStack;
  }
  print("=== Hasil ===");
  print("Data berhasil ditambahkan ke kategori barang tidak kadaluarsa.");
  print("---");
  rak1.forEach((key, value) {
    print("$key : ");
    value.printStack();
  });
  print("---");
  return true;
}

bool tambahDataDummyRak2(
    DoubleLinkedListBarang stok, Map<String, Queque> rak2, Barang barang) {
  bool statusAdd = stok.tambahBelakang(barang);
  if (statusAdd == false) {
    print("---");
    print("Pesan Error: Kode barang sudah ada!");
    print("---");
    return false;
  }
  if (rak2.containsKey(barang.namaBarang) == true) {
    rak2[barang.namaBarang]!.enqueque(barang);
  } else if (rak2.containsKey(barang.namaBarang) == false) {
    Queque newStack = Queque(100);
    newStack.enqueque(barang);
    rak2[barang.namaBarang!] = newStack;
  }
  print("=== Hasil ===");
  print("Data berhasil ditambahkan ke kategori barang tidak kadaluarsa.");
  print("---");
  rak2.forEach((key, value) {
    print("$key : ");
    value.printQueue();
  });
  print("---");
  return true;
}

void dataDummy(DoubleLinkedListBarang gudang, Map<String, Stack> rak1,
    Map<String, Queque> rak2) {
  BarangTidakKadaluarsa kipas1 = BarangTidakKadaluarsa(
      kodeBarang: "k10",
      namaBarang: "kipas angin",
      jumlahBarangDidalam: 1,
      satuan: "unit",
      tanggalBeli: "2025-06-14",
      hargaBeli: 120000,
      tanggalJual: "0",
      hargaJual: 150000,
      tanggalKadaluarsa: "0");
  BarangTidakKadaluarsa kipas2 = BarangTidakKadaluarsa(
      kodeBarang: "k11",
      namaBarang: "kipas angin",
      jumlahBarangDidalam: 1,
      satuan: "unit",
      tanggalBeli: "2025-06-14",
      hargaBeli: 120000,
      tanggalJual: "0",
      hargaJual: 150000,
      tanggalKadaluarsa: "0");
  tambahDataDummyRak1(gudang, rak1, kipas1);
  tambahDataDummyRak1(gudang, rak1, kipas2);

  BarangMudahKadaluarsa telur1 = BarangMudahKadaluarsa(
      kodeBarang: "t10",
      namaBarang: "telur",
      jumlahBarangDidalam: 12,
      satuan: "pack",
      tanggalBeli: "2025-06-14",
      hargaBeli: 12000,
      tanggalJual: "0",
      hargaJual: 15000,
      tanggalKadaluarsa: "2025-06-30");
  BarangMudahKadaluarsa telur2 = BarangMudahKadaluarsa(
      kodeBarang: "t11",
      namaBarang: "telur",
      jumlahBarangDidalam: 12,
      satuan: "pack",
      tanggalBeli: "2025-06-14",
      hargaBeli: 12000,
      tanggalJual: "0",
      hargaJual: 15000,
      tanggalKadaluarsa: "2025-06-30");
  tambahDataDummyRak2(gudang, rak2, telur1);
  tambahDataDummyRak2(gudang, rak2, telur2);
}
