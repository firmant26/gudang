import 'dart:io';

import 'package:tugas_1/abstractClassBarang.dart';
import 'package:tugas_1/classBarangMudahKadaluarsa.dart';
import 'package:tugas_1/classBarangTidakKadaluarsa.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

void editBarang(DoubleLinkedListBarang gudang, Map<String, Stack> rak1,
    Map<String, Queque> rak2) {
  print("=== Edit Barang ===");
  stdout.write("Masukkan Kode Barang = ");
  String kodeBarang = stdin.readLineSync()!;

  bool lihat = gudang.lihatSatuBarang(kodeBarang);
  if (lihat == false) {
    return;
  }

  stdout.write("Apakah benar mau mengedit barang ini? (Y/N) ");
  String yakin = stdin.readLineSync()!;

  if (yakin == "Y") {
    print("--- Silakan Sesuaikan Isi Data Barang ---");
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
    stdout.write(
        "Masukkan Tanggal Kadaluarsa Barang (Jika ada, Jika Tidak Berikan 0) = ");
    String tanggalKadaluarsa = stdin.readLineSync()!;

    NodeBarang? cari = gudang.cariBarang(kodeBarang); // NodeBarang
    Barang editBarang = cari!.data;
    String? namaBarangLama = editBarang.namaBarang;

    if (namaBarangLama != namaBarang) {
      if (editBarang is BarangMudahKadaluarsa) {
        rak2[namaBarangLama]?.deleteMiddle(namaBarangLama!);
        if (rak2[namaBarangLama]!.isEmpty()) {
          rak2.remove(namaBarangLama);
        }
        if (rak2.containsKey(namaBarang) == true) {
          rak2[namaBarang]!.enqueque(editBarang);
        } else if (rak2.containsKey(namaBarang) == false) {
          Queque newQueque = Queque(100);
          newQueque.enqueque(editBarang);
          rak2[namaBarang] = newQueque;
        }
      } else if (editBarang is BarangTidakKadaluarsa) {
        rak1[namaBarangLama]?.deleteMiddle(namaBarangLama!);
         if (rak1[namaBarangLama]!.isEmpty()) {
          rak1.remove(namaBarangLama);
        }
        if (rak1.containsKey(namaBarang) == true) {
          rak1[namaBarang]!.push(editBarang);
        } else if (rak1.containsKey(namaBarang) == false) {
          Stack newStack = Stack(100);
          newStack.push(editBarang);
          rak1[namaBarang] = newStack;
        }
      }
    }

    bool update = editBarang.editBarang(namaBarang, jumlahBarangDidalam, satuan,
        tanggalBeli, hargaBeli, hargaJual, tanggalKadaluarsa);

    if (update) {
      print("Sukses mengubah barang, berikut datanya : ");
      gudang.lihatSatuBarang(kodeBarang);
      print("--- Daftar Rak 1 ---");
      rak1.forEach((key, value) {
        print("$key : ");
        value.printStack();
      });
      print("---");
      print("--- Daftar Rak 2 ---");
      rak2.forEach((key, value) {
        print("$key : ");
        value.printQueue();
      });
      print("---");
    } else {
      print("Proses edit barang gagal!");
    }
  } else {
    print("Proses edit barang dibatalkan!");
  }
}
