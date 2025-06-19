
import 'package:tugas_1/classBarangTidakKadaluarsa.dart';

class Stack {
  int top = -1;
  int maxStack = 0;
  List<BarangTidakKadaluarsa?> elements = [];

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
      if(elements[i] != null && elements[i]!.hargaJual != null) {
      total = total! + elements[i]!.hargaJual!;
      }
    }
    return total;
  }

 void deleteMiddle(String namaBarang) {
    for (var i = 0; i < elements.length; i++) {
      if (elements[i] is BarangTidakKadaluarsa) {
        if (elements[i]?.namaBarang == namaBarang) {
          for (var j = i; j < elements.length - 1; j++) {
            elements[j] = elements[j+1];
          }
          elements[elements.length - 1] = null;
          top--;
          return;
        }
      }
    }
  }

  void push(BarangTidakKadaluarsa? data) {
    if (!isFull()) {
      top += 1;
      elements[top] = data;
    } else {
      print("Stack penuh!");
    }
  }

  BarangTidakKadaluarsa? pop() {
    BarangTidakKadaluarsa? data;
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
