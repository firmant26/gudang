import 'dart:io';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

import 'tambahBarang.dart';
import 'editBarang.dart';
import 'jualBarang.dart';

void main() {
  /**
   * 1. Tambah Barang
   * 2. Edit Barang
   * 3. Lihat Barang
   * 4. Cari Barang
   * 5. Hapus Barang
   * 6. Jual Barang
   */
  DoubleLinkedListBarang gudang = DoubleLinkedListBarang();
  Stack stack = Stack(100);
  Queque queque = Queque(100);
  var rak1 = <String, Stack>{};
  var rak2 = <String, Queque>{};

  bool proses = true;
  while (proses) {
    print("=== Gudang Kita ===");
    print("1. Tambah Barang Baru");
    print("2. Edit Barang");
    print("3. Lihat Semua Barang");
    print("4. Cari Barang");
    print("5. Hapus Barang");
    print("6. Jual Barang");
    print("7. Keluar");
    stdout.write("Pilih salah satu menu = ");
    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        tambahBarang(gudang, queque, stack, rak1, rak2);
        break;
      case 2:
        editBarang(gudang, stack, queque, rak1, rak2);
        break;
      case 3:
        gudang.lihatBarang();
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        jualBarang(gudang, stack, queque);
        break;
      case 7:
        proses = false;
        break;
      default:
        print("---");
        print("Pilihan yang anda masukkan tidak valid!");
        print("---");
    }
  }
}
