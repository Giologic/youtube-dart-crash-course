void main() {
  String takeFive(int number) {
    return '$number minus five equals ${number - 5}';
  }

  var str = takeFive(23);
  print(str);

  // Named Parameters
  namedParams({required int a, int b = 5}) {
    return a - b;
  }

  print(namedParams(a: 23, b: 34));

  // Arrow Function
  takeTen(int number) => '$number minus ten equals ${number - 10}';
  print(takeTen(99));

  // Anonymous Function
  //callIt(() => 'hola mundo!');

  // Callbacks
  subtract(int a, int b) {
    return a - b;
  }

  printSubtraction(Function callback, int a, int b) {
    print(callback(a, b) - 10);
  }

  printSubtraction(subtract, 2, 4);
}
