void main() {
  // int age = null // error;
  int? age = null;

  print(age == null); // true

  // eliminates null checks
  if (age != null) {
    // do something
  }

  // Assertion operator ! Make the compiler think the value is non-null
  String? answer;
  String result = answer!;
}

// Late initialization
class Animal {
  late final String _size;

  void goBig() {
    _size = 'big';
    print(_size);
  }
}
