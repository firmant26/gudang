import 'dart:math';

import 'package:tugas_1/classBarangMudahKadaluarsa.dart';

class Queque {
  int front = 0;
  int rear = -1;
  int maxQueque = 0;
  List<BarangMudahKadaluarsa?> elements = [];

  Queque(int max) {
    front = 0;
    rear = -1;
    maxQueque = max - 1;
    elements = List.filled(max, null);
  }

  bool isEmpty() {
    return rear == -1 && front == 0;
  }

  bool isFull() {
    return rear == maxQueque - 1;
  }

  int length() {
    int panjang = 0;
    for (var i = 0; i < elements.length; i++) {
      if (elements[i] != null) {
        panjang++;
      }
    }
    return panjang;
  }

  double? totalHargaBarang(int jumlahBarang) {
    double? total = 0;
    for (var i = 0; i < jumlahBarang; i++) {
      if (elements[i] != null && elements[i]!.hargaJual != null) {
        total = total! + elements[i]!.hargaJual!;
      }
    }
    return total;
  }

  void enqueque(BarangMudahKadaluarsa? data) {
    if (!isFull()) {
      rear += 1;
      elements[rear] = data;
    }
  }

  BarangMudahKadaluarsa? dequeque() {
    BarangMudahKadaluarsa? data;
    if (!isEmpty()) {
      data = elements[front];
      elements[front] = null;
      front += 1;
    }

    return data;
  }

  void printQueue() {
    if (!isEmpty()) {
      for (int i = rear; i > -1; i--) {
        print(
            "- ${elements[i]?.jumlahBarangDidalam} ${elements[i]?.satuan} ${elements[i]?.namaBarang} dengan harga RP${elements[i]?.hargaJual}");
      }
    } else {
      print("Tidak ada barang, masih kosong.");
    }
  }
}
