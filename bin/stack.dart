
class Stack {
  int top = -1;
  int maxStack = 0;
  List<String?> elements = [];

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

  void push(String? data) {
    if (!isFull()) {
      top += 1;
      elements[top] = data;
    } else {
      print("Stack penuh!");
    }
  }

  String? pop() {
    String? data;
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
      print("Isi rak barang 2:");
      for (int i = top; i > -1; i--) {
        print("Barang dengan kode ${elements[i]}");
      }
    } else {
      print("Rak barang 2 masih kosong");
    }
  }
}
