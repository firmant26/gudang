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

  NodeBarang? cariBarang(String? kodeBarang) {
    NodeBarang? current = head;
    while (current != null) {
      if (current.data.kodeBarang == kodeBarang) {
        return current;
      }
      current = current.next;
    }
    return null;
  }

  bool jualBarang(String? kodeBarang, String tanggalJual) {
    NodeBarang? item = cariBarang(kodeBarang);
    if (item != null) {
      item.data.tanggalJual = tanggalJual;
      return true;
    }
    print("Barang tidak ditemukan di gudang!");
    return false;
  }

  void lihatBarang() {
    if (head == null) {
      print("Tidak ada barang di gudang.");
      return;
    }
    print('------------ DAFTAR BARANG: ------------');
    NodeBarang? current = head;
    while (current != null) {
      print("Nama         : ${current.data.namaBarang}");
      print("Kode         : ${current.data.kodeBarang}");
      print(
          "Jumlah       : ${current.data.jumlahBarangDidalam} ${current.data.satuan}");
      print("Tanggal Beli : ${current.data.tanggalBeli}");
      print("Harga Beli   : ${current.data.hargaBeli}");
      print("Harga Jual   : ${current.data.hargaJual}");
      if (current.data.tanggalJual != null) {
        print("Tanggal Jual : ${current.data.tanggalJual}");
      }
      print("----------------------------------------");
      current = current.next;
    }
  }

  void lihatSatuBarang(String kodeBarang) {
    NodeBarang? node = cariBarang(kodeBarang);
    if (node != null) {
      print("------------ DETAIL BARANG: ------------");
      print("Nama         : ${node.data.namaBarang}");
      print("Kode         : ${node.data.kodeBarang}");
      print(
          "Jumlah       : ${node.data.jumlahBarangDidalam} ${node.data.satuan}");
      print("Tanggal Beli : ${node.data.tanggalBeli}");
      print("Harga Beli   : ${node.data.hargaBeli}");
      print("Harga Jual   : ${node.data.hargaJual}");
      print("----------------------------------------");
    } else {
      print("Barang dengan kode '$kodeBarang' tidak ditemukan.");
    }
  }

  void hapusBarang(String kodeBarang, DoubleLinkedListBarang barang) {
    NodeBarang? cari = barang.cariBarang(kodeBarang);
    if (cari == null) {
      print("Barang dengan kode '$kodeBarang' tidak ditemukan.");
      return;
    } else {
      if (cari.prev != null) {
        cari.prev!.next = cari.next;
      } else {
        head = cari.next; // Jika yang dihapus adalah head
      }
      if (cari.next != null) {
        cari.next!.prev = cari.prev;
      } else {
        tail = cari.prev; // Jika yang dihapus adalah tail
      }
      print("Barang dengan kode '$kodeBarang' berhasil dihapus.");
    }
  }
}
