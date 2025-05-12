// Percobaan Modul 08 - Double Linked List dalam Bahasa Dart
import 'dart:io';

class DNode<T> {
  T? nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  // Default constructor
  DNode() {
    nodeValue = null;
    next = this;
    prev = this;
  }

  // Constructor dengan parameter
  DNode.withValue(T item) {
    nodeValue = item;
    next = this;
    prev = this;
  }
}

class DoubleLinkedList<T> {
  DNode<T>? head;
  DNode<T>? tail;

  bool isEmpty() => head == null;

  // Percobaan 2: Menghapus Node dari depan
  void deleteFront() {
    if (!isEmpty()) {
      if (head!.next != null && head != tail) {
        var delete = head;
        head = head!.next;
        head!.prev = null;
        delete!.next = null;
      } else {
        head = null;
        tail = null;
      }
    }
  }

  // Percobaan 3: Menghapus Node di akhir
  void deleteEnd() {
    if (!isEmpty()) {
      if (head != tail) {
        var temp = head;
        while (temp!.next != tail) {
          temp = temp.next;
        }
        temp.next = null;
        tail = temp;
      } else {
        head = null;
        tail = null;
      }
    }
  }

  // Percobaan 4: Menampilkan List maju dan mundur
  void printList() {
    var node = head;
    DNode<T>? tailRef;

    print("Traversal Forward:");
    while (node != null) {
      stdout.write("${node.nodeValue} <-> ");
      tailRef = node;
      node = node.next;
    }
    print("null");

    print("Traversal Backward:");
    while (tailRef != null) {
      stdout.write("${tailRef.nodeValue} <-> ");
      tailRef = tailRef.prev;
    }
    print("null");
  }

  // Percobaan 5: Menambahkan node di awal
  void insertBeforeHead(T data) {
    var newNode = DNode<T>.withValue(data);
    if (isEmpty()) {
      head = tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  // Percobaan 6: Menambahkan node di akhir
  void insertTailNode(T data) {
    var newNode = DNode<T>.withValue(data);
    if (isEmpty()) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  // Latihan 1: Menambahkan node sebelum node tertentu (baca maju)
  void tambahNode_Sebelum(DNode<T> newNode, DNode<T> target) {
    var current = head;
    while (current != null) {
      if (current == target) {
        newNode.next = current;
        newNode.prev = current.prev;
        if (current.prev != null) {
          current.prev!.next = newNode;
        } else {
          head = newNode; // jika target adalah head
        }
        current.prev = newNode;
        return;
      }
      current = current.next;
    }
    print("Target node tidak ditemukan.");
  }
}

void main() {
  var dll = DoubleLinkedList<String>();

  dll.insertTailNode("A");
  dll.insertTailNode("B");
  dll.insertTailNode("C");
  dll.printList();

  print("\nSetelah tambah node 'X' sebelum 'B':");
  var newNode = DNode<String>.withValue("X");
  dll.tambahNode_Sebelum(newNode, dll.head!.next!); // Menyisipkan sebelum B
  dll.printList();
}
