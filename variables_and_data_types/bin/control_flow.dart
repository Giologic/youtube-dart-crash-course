void main() {
  String color = 'red';

  if (color == 'blue') {
  } else if (color == 'green') {
  } else {}

  if (color == 'red') print("red");

  String thing1 = '';
  if (thing1.isEmpty) {
    print("Empty");
  }

  String? thing2;
  if (thing2 != null) {}

  for (int i = 0; i < 2; i++) {
    print(i);
  }

  int j = 0;
  do {
    j++;
    print(j);
  } while (j < 5);

  // Assert
  String text = 'good';
  assert(text == 'bad');
}
