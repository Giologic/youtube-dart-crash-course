void main() {
  List<int> list = [1, 2, 3, 4, 5];
  list[0];

  list.sublist(2, 5);
  print(list.sublist(2, 5));

  for (int number in list) {
    print(number);
  }

  list.forEach(print);

  var doubled = list.map((number) => number * 2);
  print(doubled);
  doubled.forEach(print);
}
