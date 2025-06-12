import 'dart:io';

import 'package:tugas_1/abstractClassBarang.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

void hapusBarang(Map<String, Stack> rak1, Map<String, Queque> rak2,
  DoubleLinkedListBarang gudang) {
  stdout.write("Masukkan kode barang yang ingin dihapus: ");
  String kodeBarang = stdin.readLineSync()!;

  if (!gudang.findKodeBarang(kodeBarang)) {
  print("Barang dengan kode $kodeBarang tidak ditemukan.");
  return;
  }

  // Hapus dari gudang (DoubleLinkedListBarang)
  gudang.hapusBarang(kodeBarang, gudang);

  // Hapus dari rak1 (Stack) - hapus elemen dengan kodeBarang di setiap stack
  rak1.forEach((key, stack) {
  for (int i = stack.top; i >= 0; i--) {
    var item = stack.elements[i];
    if (item != null && item.kodeBarang == kodeBarang) {
    // Hapus elemen dengan menggeser elemen di atasnya ke bawah
    for (int j = i; j < stack.top; j++) {
      stack.elements[j] = stack.elements[j + 1];
    }
    stack.elements[stack.top] = null;
    stack.top--;
    break; // Jika hanya satu, keluar dari loop
    }
  }
  });

  // Hapus dari rak2 (Queue) - hapus elemen dengan kodeBarang di setiap queue
  rak2.forEach((key, queque) {
    int newFront = -1;
    int newRear = -1;
    List<dynamic> newElements = List.filled(queque.elements.length, null);

    // Cek apakah queue kosong
    if (queque.front != -1 && queque.rear != -1 && queque.front <= queque.rear) {
      for (int i = queque.front; i <= queque.rear; i++) {
        var item = queque.elements[i];
        if (item != null && item.kodeBarang != kodeBarang) {
          newRear++;
          newElements[newRear] = item;
          if (newFront == -1) newFront = 0;
        }
      }
    }
    queque.elements.setAll(0, newElements.cast<Barang?>());
    queque.front = newFront;
    queque.rear = newRear;
  });

  print("Barang dengan kode $kodeBarang telah dihapus dari gudang, rak1, dan rak2.");

  print("Isi rak1:");
  rak1.forEach((key, stack) {
  print("Key: $key");
  for (int i = stack.top; i > -1; i--) {
    var item = stack.elements[i];
    print(
    "- ${item?.namaBarang} dengan kode ${item?.kodeBarang}, dibeli pada ${item?.tanggalBeli}");
  }
  });
  print("Isi rak2:");
  rak2.forEach((key, queque) {
  print("Key: $key");
  for (int i = queque.front; i > -1 && i <= queque.rear; i++) {
    var item = queque.elements[i];
    print("- ${item?.namaBarang} dengan kode ${item?.kodeBarang}, dibeli pada ${item?.tanggalBeli}");
  }
  });
}
