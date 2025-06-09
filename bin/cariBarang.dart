import 'dart:io';

import 'package:tugas_1/abstractClassBarang.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

void cariBarang(Map<String, Stack> rak1, Map<String, Queque> rak2) {
  print("=== Cari Barang ===");
  stdout.write("Masukkan Nama Barang = ");
  String namaBarang = stdin.readLineSync()!;

  if (rak1.containsKey(namaBarang)) {
    rak1.forEach((key, value) {
      if(namaBarang == key) {
        print("Barang ditemukan di Rak 1:");
        value.printStack();
      }
    });
  } else if (rak2.containsKey(namaBarang)) {
    rak2.forEach((key, value) {
      if(namaBarang == key) {
        print("Barang ditemukan di Rak 2:");
        value.printQueue();
      }
    });
  } else {
    print("Barang tidak ditemukan di Rak 1 atau Rak 2.");

  }

}
