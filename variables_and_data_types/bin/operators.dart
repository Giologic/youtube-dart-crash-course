class Person {
  String firstName;
  String lastName;
  int age;

  Person(this.firstName, this.lastName, this.age);
}

void main() {
  String? name;
  name ??= 'Guest';
  var z = name ?? 'Guest';

  // Cascade
  Person person = Person('Gio', 'Velez', 27)
    ..lastName = 'Tan'
    ..age = 43;

  print(person.firstName);

  // Typecast
  var number = 23 as String;
}
