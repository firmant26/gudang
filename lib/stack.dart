
import 'package:tugas_1/abstractClassBarang.dart';

class Stack {
  int top = -1;
  int maxStack = 0;
  List<Barang?> elements = [];

  Stack(int max) {
    maxStack = max;
    elements = List.filled(max, null);
  }

  bool isEmpty() {
    return top == -1;
  }

  bool isFull() {
    return top == maxStack - 1;
  }

  int length() {
    return elements.length;
  }

   double? totalHargaBarang(int jumlahBarang) {
    double? total = 0;
    for (var i = 0; i < jumlahBarang; i++) {
      if(elements[i] != null && elements[i]!.hargaJual != null) {
      total = total! + elements[i]!.hargaJual!;
      }
    }
    return total;
  }



  void push(Barang? data) {
    if (!isFull()) {
      top += 1;
      elements[top] = data;
    } else {
      print("Stack penuh!");
    }
  }

  Barang? pop() {
    Barang? data;
    if (!isEmpty()) {
      data = elements[top];
      elements[top] = null;
      top -= 1;
    } else {
      print("Stack kosong!");
    }
    return data;
  }

  void printStack() {
    if (!isEmpty()) {
      for (int i = top; i > -1; i--) {
        print("${elements[i]?.jumlahBarangDidalam} ${elements[i]?.satuan} ${elements[i]?.namaBarang} dengan harga RP${elements[i]?.hargaJual}");
      }
    } else {
      print("Tidak ada barang, masih kosong.");
    }
  }
}
