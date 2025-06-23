import 'dart:io';

import 'package:tugas_1/classBarangMudahKadaluarsa.dart';
import 'package:tugas_1/classBarangTidakKadaluarsa.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

bool tambahBarang(DoubleLinkedListBarang stok, Map<String, Stack> rak1,
    Map<String, Queque> rak2) {
  print("=== Tambah Barang Baru ===");
  stdout.write("Masukkan Kode Barang = ");
  String kodeBarang = stdin.readLineSync()!;

  // validasi apakah sudah ada kode barang di double linked list
  bool findKodeBarang = stok.findKodeBarang(kodeBarang);
  if (findKodeBarang) {
    print("---");
    print("Pesan Error: Kode barang sudah ada!");
    print("---");
    return false;
  }

  stdout.write("Masukkan Nama Barang = ");
  String namaBarang = stdin.readLineSync()!;
  stdout.write("Masukkan Jumlah Barang Di dalam = ");
  int jumlahBarangDidalam = int.parse(stdin.readLineSync()!);

  // validasi apakah jumlah barang di 
  if (jumlahBarangDidalam <= 0) {
    print("---");
    print(
        "Pesan Error: Jumlah barang didalam tidak boleh kurang dari sama dengan 1!");
    print("---");
    return false;
  }

  stdout.write("Masukkan Satuan Barang = ");
  String satuan = stdin.readLineSync()!;
  stdout.write("Masukkan Tanggal Beli Barang (Masuk Gudang) = ");
  String tanggalBeli = stdin.readLineSync()!;
  stdout.write("Masukkan Harga Beli Barang = ");
  double hargaBeli = double.parse(stdin.readLineSync()!);
  stdout.write("Masukkan Harga Jual Barang = ");
  double hargaJual = double.parse(stdin.readLineSync()!);
  stdout.write(
      "Masukkan Tanggal Kadaluarsa Barang (Jika ada, Jika Tidak Berikan 0) = ");
  String tanggalKadaluarsa = stdin.readLineSync()!;

  if (tanggalKadaluarsa == "0") {
    try {
      BarangTidakKadaluarsa barang = BarangTidakKadaluarsa(
          kodeBarang: kodeBarang,
          namaBarang: namaBarang,
          jumlahBarangDidalam: jumlahBarangDidalam,
          satuan: satuan,
          tanggalBeli: tanggalBeli,
          hargaBeli: hargaBeli,
          hargaJual: hargaJual,
          tanggalJual: "0");
      stok.tambahBelakang(barang);
      if (rak1.containsKey(namaBarang) == true) {
        rak1[namaBarang]!.push(barang);
      } else if (rak1.containsKey(namaBarang) == false) {
        Stack newStack = Stack(100);
        newStack.push(barang);
        rak1[namaBarang] = newStack;
      }
      print("=== Hasil ===");
      print("Data berhasil ditambahkan ke kategori barang tidak kadaluarsa.");
      print("---");
      rak1.forEach((key, value) {
        print("$key : ");
        value.printStack();
      });
      print("---");
    } catch (e) {
      print("---");
      print("Pesan Error: $e!");
      print("---");
    }
  } else {
    try {
      BarangMudahKadaluarsa barang = BarangMudahKadaluarsa(
          tanggalKadaluarsa: tanggalKadaluarsa,
          kodeBarang: kodeBarang,
          namaBarang: namaBarang,
          jumlahBarangDidalam: jumlahBarangDidalam,
          satuan: satuan,
          tanggalBeli: tanggalBeli,
          hargaBeli: hargaBeli,
          hargaJual: hargaJual,
          tanggalJual: "0");
      stok.tambahBelakang(barang);
      if (rak2.containsKey(namaBarang) == true) {
        rak2[namaBarang]!.enqueque(barang);
      } else if (rak2.containsKey(namaBarang) == false) {
        Queque newQueque = Queque(100);
        newQueque.enqueque(barang);
        rak2[namaBarang] = newQueque;
      }
      print("=== Hasil ===");
      print("Data berhasil ditambahkan ke kategori barang mudah kadaluarsa.");
      print("---");
      rak2.forEach((key, value) {
        print("$key: ");
        value.printQueue();
      });
      //print(rak2);
      print("---");
    } catch (e) {
      print("---");
      print("Pesan Error: $e!");
      print("---");
    }
  }

  return true;
}
