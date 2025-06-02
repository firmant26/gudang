class Queque {
  int front = 0;
  int rear = -1;
  int maxQueque = 0;
  List<String?> elements = [];

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

  void enqueque(String? data) {
    if (!isFull()) {
      rear += 1;
      elements[rear] = data;
    }
  }

  String? dequeque() {
    String? data;
    if (!isEmpty()) {
      data = elements[front];
      elements[front] = null;
      front += 1;
    }

    return data;
  }

  void printQueue() {
    if (!isEmpty()) {
    print("Menampilkan barang bisa kadaluarsa");
      for (int i = rear; i > -1; i--) {
        print("Barang dengan kode ${elements[i]}");
      }
    } else {
      print("Masih kosong");
    }
  }

}
