import 'classes.dart';

void higherOrderFunctions() {
  final names = mapping();
  names.forEach(print);

  sorting();
  filtering();
  reducing();
  flattening();
}

List<Map> data = [
  {'first': 'Nada', 'last': 'Mueller', 'age': 10},
  {'first': 'Kurt', 'last': 'Gibbons', 'age': 9},
  {'first': 'Natalya', 'last': 'Compton', 'age': 15},
  {'first': 'Kaycee', 'last': 'Grant', 'age': 20},
  {'first': 'Kody', 'last': 'Ali', 'age': 17},
  {'first': 'Rhodri', 'last': 'Marshall', 'age': 30},
  {'first': 'Kali', 'last': 'Fleming', 'age': 9},
  {'first': 'Steve', 'last': 'Goulding', 'age': 32},
  {'first': 'Ivie', 'last': 'Haworth', 'age': 14},
  {'first': 'Anisha', 'last': 'Bourne', 'age': 40},
  {'first': 'Dominique', 'last': 'Madden', 'age': 31},
  {'first': 'Kornelia', 'last': 'Bass', 'age': 20},
  {'first': 'Saad', 'last': 'Feeney', 'age': 2},
  {'first': 'Eric', 'last': 'Lindsey', 'age': 51},
  {'first': 'Anushka', 'last': 'Harding', 'age': 23},
  {'first': 'Samiya', 'last': 'Allen', 'age': 18},
  {'first': 'Rabia', 'last': 'Merrill', 'age': 6},
  {'first': 'Safwan', 'last': 'Schaefer', 'age': 41},
  {'first': 'Celeste', 'last': 'Aldred', 'age': 34},
  {'first': 'Taio', 'last': 'Mathews', 'age': 17},
];

List<Name> mapping() {
  final names = data.map<Name>((Map rawName) {
    final firstName = rawName['first'] as String;
    final lastName = rawName['last'] as String;
    return Name(firstName, lastName);
  }).toList();

  return names;
}

void sorting() {
  final names = mapping();
  names.sort((a, b) => a.lastName.compareTo(b.lastName));

  print('');
  print('Alphabetically sorted names:');
  names.forEach(print);
}

void filtering() {
  final names = mapping();
  final filteredNames = names
      .where((name) => name.firstName.startsWith('K'))
      .toList();

  print('');
  print('Names starting with "K":');
  filteredNames.forEach(print);
}

void reducing() {
  final allAges = data.map<int>((person) => person['age'] as int);
  final total = allAges.reduce((total, age) => total + age);
  final average = total / allAges.length;

  print('The average age is $average');
}

void flattening() {
  final matrix = [
    [1, 0, 0],
    [0, 0, -1],
    [0, 1, 0],
  ];

  final linear = matrix.expand<int>((row) => row);
  print(linear);
}

void main() {
  higherOrderFunctions();
}
