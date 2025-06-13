import 'dart:io';

import 'package:tugas_1/abstractClassBarang.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

bool jualBarang(DoubleLinkedListBarang gudang, Map<String, Stack> rak1,
    Map<String, Queque> rak2) {
  try {
    print("=== Jual Barang ===");
    stdout.write("Masukkan Nama Barang = ");
    String namaBarang = stdin.readLineSync()!;
    stdout.write("Masukkan Jumlah Pembelian = ");
    int jumlahPembelian = int.parse(stdin.readLineSync()!);
    print("$namaBarang $jumlahPembelian");
    double totalHargaBarang;
    if (rak1.containsKey(namaBarang)) {
      totalHargaBarang = rak1[namaBarang]!.totalHargaBarang(jumlahPembelian)!;
      print("Harga = $totalHargaBarang");
    } else if (rak2.containsKey(namaBarang)) {
      totalHargaBarang = rak2[namaBarang]!.totalHargaBarang(jumlahPembelian)!;
      print("Harga = $totalHargaBarang");
    } else {
      print("Nama barang tidak ada di rak manapun!");
      return false;
    }
    if (totalHargaBarang == null) {
      print("Total harga tidak valid");
      return false;
    }
    stdout.write("Masukkan Nominal Uang Dari Pelanggan = ");
    double nominal = double.parse(stdin.readLineSync()!);

    int stok;
    double kembalian;
    if (rak1.containsKey(namaBarang)) {
      stok = rak1[namaBarang]!.length();
      if (stok < jumlahPembelian) {
        print("Stok tidak cukup untuk melanjutkan pembelian!");
        return false;
      }
      if (totalHargaBarang <= nominal) {
        // proses menghapus barang di stack
        for (var i = 0; i < jumlahPembelian; i++) {
          if (rak1[namaBarang]?.elements[i]!.kodeBarang != null) {
            String? kodeBarang = rak1[namaBarang]?.elements[i]!.kodeBarang;
            rak1[namaBarang]?.pop();
            // proses menambahkan tanggal jual di barang
            gudang.jualBarang(kodeBarang, DateTime.now().toString());
          }
        }
      }
      kembalian = nominal - totalHargaBarang;
      print("Proses pembelian selesai, kembalian = $kembalian");
    } else if (rak2.containsKey(namaBarang)) {
      stok = rak2[namaBarang]!.length();
      if (stok < jumlahPembelian) {
        print("Stok tidak cukup untuk melanjutkan pembelian!");
        return false;
      }
      if (totalHargaBarang <= nominal) {
        // proses menghapus barang di queque
        for (var i = 0; i < jumlahPembelian; i++) {
          if (rak1[namaBarang]?.elements[i]!.kodeBarang != null) {
            String? kodeBarang = rak2[namaBarang]?.elements[i]!.kodeBarang;
            rak2[namaBarang]?.dequeque();
            // proses menambahkan tanggal jual di barang
            gudang.jualBarang(kodeBarang, DateTime.now().toString());
          }
        }
      }
      kembalian = nominal - totalHargaBarang;
      print("Proses pembelian selesai, kembalian = $kembalian");
    }

    return true;
  } catch (e, stackTrace) {
    print("Terjadi kesalahan: ${e.toString()}");
    print("StackTrace:\n$stackTrace");
    return false;
  }
}
