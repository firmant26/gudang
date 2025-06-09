
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
        print("- ${elements[i]?.namaBarang} dengan kode ${elements[i]?.kodeBarang}, dibeli pada ${elements[i]?.tanggalBeli}");
      }
    } else {
      print("Rak barang 2 masih kosong");
    }
  }
}
