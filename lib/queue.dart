import 'dart:math';

import 'package:tugas_1/classBarangMudahKadaluarsa.dart';

// Queque Circular Array
class Queque {
  int front = 0, rear = 0, size = 0;
  int capacity = 0;
  List<BarangMudahKadaluarsa?> elements = [];

  Queque(this.capacity) {
    front = size = 0;
    rear = capacity - 1;
    elements = List.filled(capacity, null);
  }

  bool isFull() {
    return (size == capacity);
  }

  bool isEmpty() {
    return (size == 0);
  }

  void enqueque(BarangMudahKadaluarsa item) {
    if (isFull()) return;
    rear = (rear + 1) % capacity;
    elements[rear] = item;
    size++;
    print('$item enqueued to queue');
  }

  BarangMudahKadaluarsa? dequeque() {
    if (isEmpty()) return null;
    BarangMudahKadaluarsa? item = elements[front];
    elements[front] = null;
    front = (front + 1) % capacity;
    size--;
    return item;
  }

  BarangMudahKadaluarsa? frontElement() {
    if (isEmpty()) return null;
    return elements[front];
  }

  BarangMudahKadaluarsa? rearElement() {
    if (isEmpty()) return null;
    return elements[rear];
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

  void deleteMiddle(String namaBarang) {
    for (var i = 0; i < elements.length; i++) {
      if (elements[i] is BarangMudahKadaluarsa) {
        if (elements[i]?.namaBarang == namaBarang) {
          for (var j = i; j < elements.length - 1; j++) {
            elements[j] = elements[j + 1];
          }
          elements[elements.length - 1] = null;
          rear--;
          return;
        }
      }
    }
  }

  void printQueue() {
    if (!isEmpty()) {
      for (int i = rear; i > -1; i--) {
        if (elements[i] != null) {
          print("- ${elements[i]?.jumlahBarangDidalam} ${elements[i]?.satuan} ${elements[i]?.namaBarang} dengan harga RP${elements[i]?.hargaJual}");
        }
      }
    } else {
      print("Tidak ada barang, masih kosong.");
    }
  }
}

// Queque Non Circular Array
// class Queque {
//   int front = 0;
//   int rear = -1;
//   int maxQueque = 0;
//   List<BarangMudahKadaluarsa?> elements = [];

//   Queque(int max) {
//     front = 0;
//     rear = -1;
//     maxQueque = max - 1;
//     elements = List.filled(max, null);
//   }

//   bool isEmpty() {
//     return rear == -1 && front == 0;
//   }

//   bool isFull() {
//     return rear == maxQueque - 1;
//   }

//   int length() {
//     int panjang = 0;
//     for (var i = 0; i < elements.length; i++) {
//       if (elements[i] != null) {
//         panjang++;
//       }
//     }
//     return panjang;
//   }

//   double? totalHargaBarang(int jumlahBarang) {
//     double? total = 0;
//     for (var i = 0; i < jumlahBarang; i++) {
//       if (elements[i] != null && elements[i]!.hargaJual != null) {
//         total = total! + elements[i]!.hargaJual!;
//       }
//     }
//     return total;
//   }

//    void deleteMiddle(String namaBarang) {
//     for (var i = 0; i < elements.length; i++) {
//       if (elements[i] is BarangMudahKadaluarsa) {
//         if (elements[i]?.namaBarang == namaBarang) {
//           for (var j = i; j < elements.length - 1; j++) {
//             elements[j] = elements[j+1];
//           }
//           elements[elements.length - 1] = null;
//           rear--;
//           return;
//         }
//       }
//     }
//   }

//   void enqueque(BarangMudahKadaluarsa? data) {
//     if (!isFull()) {
//       rear += 1;
//       elements[rear] = data;
//     }
//   }

//   BarangMudahKadaluarsa? dequeque() {
//     BarangMudahKadaluarsa? data;
//     if (!isEmpty()) {
//       data = elements[front];
//       elements[front] = null;
//       front += 1;
//     }

//     return data;
//   }

//   void printQueue() {
//     if (!isEmpty()) {
//       for (int i = rear; i > -1; i--) {
//         print("- ${elements[i]?.jumlahBarangDidalam} ${elements[i]?.satuan} ${elements[i]?.namaBarang} dengan harga RP${elements[i]?.hargaJual}");
//       }
//     } else {
//       print("Tidak ada barang, masih kosong.");
//     }
//   }
// }
