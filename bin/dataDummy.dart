import 'package:tugas_1/classBarangMudahKadaluarsa.dart';
import 'package:tugas_1/classBarangTidakKadaluarsa.dart';
import 'package:tugas_1/doubleLinkedList.dart';
import 'package:tugas_1/queue.dart';
import 'package:tugas_1/stack.dart';

void dataDummy(DoubleLinkedListBarang gudang, Map<String, Stack> rak1, Map<String, Queque> rak2) {
  BarangTidakKadaluarsa kipas1 = BarangTidakKadaluarsa(
      kodeBarang: "k10",
      namaBarang: "kipas angin",
      jumlahBarangDidalam: 1,
      satuan: "unit",
      tanggalBeli: "2025-06-14",
      hargaBeli: 120000,
      tanggalJual: "0",
      hargaJual: 150000,
      tanggalKadaluarsa: "0");
  BarangTidakKadaluarsa kipas2 = BarangTidakKadaluarsa(
      kodeBarang: "k11",
      namaBarang: "kipas angin",
      jumlahBarangDidalam: 1,
      satuan: "unit",
      tanggalBeli: "2025-06-14",
      hargaBeli: 120000,
      tanggalJual: "0",
      hargaJual: 150000,
      tanggalKadaluarsa: "0");

  Stack rakBarang1 = Stack(100);
  rakBarang1.push(kipas1);
  rakBarang1.push(kipas2);
  rak1["kipas angin"] = rakBarang1;

  BarangMudahKadaluarsa telur1 = BarangMudahKadaluarsa(
      kodeBarang: "t10",
      namaBarang: "telur",
      jumlahBarangDidalam: 12,
      satuan: "pack",
      tanggalBeli: "2025-06-14",
      hargaBeli: 12000,
      tanggalJual: "0",
      hargaJual: 15000,
      tanggalKadaluarsa: "2025-06-30");
  BarangMudahKadaluarsa telur2 = BarangMudahKadaluarsa(
      kodeBarang: "t11",
      namaBarang: "telur",
      jumlahBarangDidalam: 12,
      satuan: "pack",
      tanggalBeli: "2025-06-14",
      hargaBeli: 12000,
      tanggalJual: "0",
      hargaJual: 15000,
      tanggalKadaluarsa: "2025-06-30");

  Queque rakBarang2 = Queque(100);
  rakBarang2.enqueque(telur1);
  rakBarang2.enqueque(telur2);
  rak2["telur"] = rakBarang2;

  gudang.tambahBelakang(kipas1);
  gudang.tambahBelakang(kipas2);
  gudang.tambahBelakang(telur1);
  gudang.tambahBelakang(telur2);
}
