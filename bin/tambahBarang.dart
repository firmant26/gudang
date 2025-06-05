import 'dart:io';

import 'package:tugas_1/classBarangMudahKadaluarsa.dart';
import 'package:tugas_1/classBarangTidakKadaluarsa.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

bool tambahBarang(DoubleLinkedListBarang stok, Queque queque, Stack stack) {
  print("=== Tambah Barang Baru ===");
  stdout.write("Masukkan Kode Barang = ");
  String kodeBarang = stdin.readLineSync()!;
  stdout.write("Masukkan Nama Barang = ");
  String namaBarang = stdin.readLineSync()!;
  stdout.write("Masukkan Jumlah Barang Di dalam = ");
  int jumlahBarangDidalam = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan Satuan Barang = ");
  String satuan = stdin.readLineSync()!;
  stdout.write("Masukkan Tanggal Beli Barang (Masuk Gudang) = ");
  String tanggalBeli = stdin.readLineSync()!;
  stdout.write("Masukkan Harga Beli Barang = ");
  double hargaBeli = double.parse(stdin.readLineSync()!);
  stdout.write("Masukkan Harga Jual Barang = ");
  double hargaJual = double.parse(stdin.readLineSync()!);
  stdout.write("Masukkan Tanggal Kadaluarsa Barang (Jika ada, Jika Tidak Berikan 0) = ");
  String tanggalKadaluarsa = stdin.readLineSync()!;

  String tanggalKadaluarsaValid = "";
  if (tanggalKadaluarsa != "0") {
    DateTime cekTanggalKadaluarsa = DateTime.parse(tanggalKadaluarsa);
    if (cekTanggalKadaluarsa != null && cekTanggalKadaluarsa.isAfter(DateTime.now())) {
      tanggalKadaluarsaValid = tanggalKadaluarsa;
    } else {
      print("Tanggal Kadaluarsa tidak valid!");
      return false;
    }
  } else {
    tanggalKadaluarsaValid = "0";
  }

  if (tanggalKadaluarsaValid == "0") {
    BarangTidakKadaluarsa barang = BarangTidakKadaluarsa(kodeBarang: kodeBarang, namaBarang: namaBarang, jumlahBarangDidalam: jumlahBarangDidalam, satuan: satuan, tanggalBeli: tanggalBeli, hargaBeli: hargaBeli, hargaJual: hargaJual, tanggalJual: "0");
    stack.push(kodeBarang);
    stok.tambahBelakang(barang);
    print("=== Hasil ===");
    print("Data berhasil ditambahkan ke kategori barang tidak kadaluarsa.");
    print("---");
    stack.printStack();
    print("---");
  } else {
    BarangMudahKadaluarsa barang = BarangMudahKadaluarsa(tanggalKadaluarsa: tanggalKadaluarsa, kodeBarang: kodeBarang, namaBarang: namaBarang, jumlahBarangDidalam: jumlahBarangDidalam, satuan: satuan, tanggalBeli: tanggalBeli, hargaBeli: hargaBeli, hargaJual: hargaJual, tanggalJual: "0");
    queque.enqueque(kodeBarang);
    stok.tambahBelakang(barang);
    print("=== Hasil ===");
    print("Data berhasil ditambahkan ke kategori barang mudah kadaluarsa.");
    print("---");
    queque.printQueue();
    print("---");
  }

  return true;
}
