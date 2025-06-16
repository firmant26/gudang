import 'dart:ffi';
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

    // Mengecek Ketersediaan Nama Barang

    if (rak1.containsKey(namaBarang) || rak2.containsKey(namaBarang) == false) {
      print("Pesan Error : Nama Barang Tidak Ditemukan!");
      return false;
    }

    // Proses Mengecek Ketersediaan Nama Barang Selesai
    stdout.write("Masukkan Jumlah Pembelian = ");
    int jumlahPembelian = int.parse(stdin.readLineSync()!);
    print("$namaBarang $jumlahPembelian");

    // Mengecek Stok Barang

    if (rak1.containsKey(namaBarang)) {
      if (rak1[namaBarang]!.length() < jumlahPembelian) {
        print("Pesan Error: Stok Barang Tidak Cukup!");
        return false;
      }
    }

    if (rak2.containsKey(namaBarang)) {
      if (rak2[namaBarang]!.length() < jumlahPembelian) {
        print("Pesan Error: Stok Barang Tidak Cukup!");
        return false;
      }
    }

    // Proses Mengecek Stok Barang Selesai

    // Menghitung Total Harga Barang
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
    if (totalHargaBarang == 0) {
      print("Barang sudah tidak ada!");
      return false;
    }

    // Proses Menghitung Total Harga Barang Selesai

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
      if (nominal >= totalHargaBarang) {
        // proses menghapus barang di stack
        for (var i = 0; i < jumlahPembelian; i++) {
          if (rak1[namaBarang]?.elements[i]!.kodeBarang != null) {
            String? kodeBarang = rak1[namaBarang]?.elements[i]!.kodeBarang;
            rak1[namaBarang]?.pop();
            // proses menambahkan tanggal jual di barang
            gudang.jualBarang(kodeBarang, DateTime.now().toString());
          }
        }
        kembalian = nominal - totalHargaBarang;
        print("Proses pembelian selesai, kembalian = RP$kembalian");
      } else {
        print("Uang tidak cukup!");
      }
    } else if (rak2.containsKey(namaBarang)) {
      stok = rak2[namaBarang]!.length();
      if (stok < jumlahPembelian) {
        print("Stok tidak cukup untuk melanjutkan pembelian!");
        return false;
      }
      if (nominal >= totalHargaBarang) {
        // proses menghapus barang di queque
        for (var i = 0; i < jumlahPembelian; i++) {
          if (rak1[namaBarang]?.elements[i]!.kodeBarang != null) {
            String? kodeBarang = rak2[namaBarang]?.elements[i]!.kodeBarang;
            rak2[namaBarang]?.dequeque();
            // proses menambahkan tanggal jual di barang
            gudang.jualBarang(kodeBarang, DateTime.now().toString());
          }
        }
        kembalian = nominal - totalHargaBarang;
        print("Proses pembelian selesai, kembalian = RP$kembalian");
      } else {
        print("Uang tidak cukup!");
      }
    }

    return true;
  } catch (e, stackTrace) {
    print("Terjadi kesalahan: ${e.toString()}");
    print("StackTrace:\n$stackTrace");
    return false;
  }
}
