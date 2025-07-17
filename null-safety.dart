void main() {
  int? someNumber;
  increaseValue(someNumber);

  var bruce = Person('Bruce', 'Wayne', age: 30);
  if ((bruce.age ?? 0) < 18) {
    print('Minor');
  }

  Person? person;
  print(person!.name);
}

void increaseValue(int? value) {
  value = value ?? 0;
  print(value);
}

class Person {
  late String name;
  late String surname;
  int? age;

  Person(this.name, this.surname, {this.age});

  Person.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    surname = map['surname'];
  }
}
