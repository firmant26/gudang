import 'abstractClassBarang.dart';

class NodeBarang {
  Barang data;
  NodeBarang? prev;
  NodeBarang? next;

  NodeBarang(this.data);
}

class DoubleLinkedListBarang {
  NodeBarang? head;
  NodeBarang? tail;

  bool findKodeBarang(String kodeBarang) {
    NodeBarang? current = head;
    while (current != null) {
      if (current.data.kodeBarang == kodeBarang) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  void tambahDepan(Barang barang) {
    NodeBarang node = NodeBarang(barang);
    if (head == null) {
      head = tail = node;
    } else {
      node.next = head;
      head!.prev = node;
      head = node;
    }
  }

  void tambahBelakang(Barang barang) {
    NodeBarang node = NodeBarang(barang);
    if (tail == null) {
      head = tail = node;
    } else {
      tail!.next = node;
      node.prev = tail;
      tail = node;
    }
  }

  void tampilkanDariDepan() {
    NodeBarang? current = head;
    while (current != null) {
      print(current.data.namaBarang);
      current = current.next;
    }
  }

  void tampilkanDariBelakang() {
    NodeBarang? current = tail;
    while (current != null) {
      print(current.data.namaBarang);
      current = current.prev;
    }
  }

  // Ubah parameter ke int
  NodeBarang? cariBarang(int kodeBarang) {
    NodeBarang? current = head;
    while (current != null) {
      if (current.data.kodeBarang == kodeBarang) {
        return current;
      }
      current = current.next;
    }
    return null;
  }

  void lihatBarang(int kodeBarang) {
    NodeBarang? node = cariBarang(kodeBarang);
    if (node != null) {
      print("------------ DETAIL BARANG: ------------");
      print("Nama: ${node.data.namaBarang}");
      print("Kode: ${node.data.kodeBarang}");
      print("Exp: ${node.data.tanggalBeli}");
      // Tambahkan field lain sesuai kebutuhan
    } else {
      print("Barang dengan kode '$kodeBarang' tidak ditemukan.");
    }
  }

  bool editBarang(int kodeBarang, {String? namaBaru, String? tanggalBeliBaru}) {
    NodeBarang? node = cariBarang(kodeBarang);
    if (node != null) {
      if (namaBaru != null) node.data.namaBarang = namaBaru;
      if (tanggalBeliBaru != null) node.data.tanggalBeli = tanggalBeliBaru;
      return true;
    }
    return false;
  }
}

