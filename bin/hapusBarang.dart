import 'dart:io';

import 'package:tugas_1/abstractClassBarang.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

void hapusBarang(Map<String, Stack> rak1, Map<String, Queque> rak2,
    DoubleLinkedListBarang gudang) {
  print("=== Hapus Barang ===");
  stdout.write("Masukkan Kode Barang yang akan dihapus = ");
  String kodeBarang = stdin.readLineSync()!;

  bool ditemukan = false;

  if (rak1.containsKey(kodeBarang)) {
    print("Barang ditemukan di Rak 1:");
    rak1[kodeBarang]?.printStack();
    rak1.remove(kodeBarang);
    gudang.hapusBarang(kodeBarang, gudang);
    print("Barang '$kodeBarang' berhasil dihapus dari Rak 1.");
  } else if (rak2.containsKey(kodeBarang)) {
    print("Barang ditemukan di Rak 2:");
    rak2[kodeBarang]?.printQueue();
    rak2.remove(kodeBarang);
    gudang.hapusBarang(kodeBarang, gudang);
    print("Barang '$kodeBarang' berhasil dihapus dari Rak 2.");
    ditemukan = true;
  } else {
    print("Barang tidak ditemukan di Rak 1 atau Rak 2.");
  }
}
