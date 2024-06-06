void main() {
  int num1 = 2;
  double num2 = 2.3;
  bool isTrue = true;

  print((num1 + num2) is int);
  print((num1 + num2).runtimeType);

  String firstName = 'Gio';
  String lastName = 'Velez';

  String fullName = '$lastName, $firstName';

  print(fullName);

  var username = 'GiologicX';
  username = 'Test';
  print(username);

  final String fullname2 = 'Gio';

  const int age = 75;
  const int favNumber = age + 23;
  print(favNumber);
}
