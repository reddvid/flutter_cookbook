void collectionPlayground() {
  listPlayground();
  mapPlayground();
  setPlayground();
  collectionControlFlow();
}

void listPlayground() {
  final List<int> numbers = [1, 2, 3, 4, 5];
  numbers.add(11);
  numbers.addAll([8, 12, 20]);
  numbers[1] = 15;

  print('The scond number is ${numbers[1]}');
  for (var number in numbers) {
    print(number);
  }
}

void mapPlayground() {
  final Map<String, int> ages = {'Clark': 34, 'Peter': 21, 'Bruce': 45};

  ages['Steve'] = 80;

  final ageOfPeter = ages['Peter'];
  print('Peter is $ageOfPeter years old.');

  ages.remove('Peter');

  ages.forEach((String name, int age) {
    print('$name is $age years old.');
  });
}

void setPlayground() {
  final Set<String> ministers = {'Justin', 'Paul', 'David'};
  ministers.addAll({'Mike', 'Bob', 'Aaron'});

  final isJustinAMinister = ministers.contains('Justin');
  print(isJustinAMinister);

  for (String primeMinister in ministers) {
    print('$primeMinister is a minister.');
  }
}

void collectionControlFlow() {
  final addMore = true;
  final randomNumbers = [
    32,
    223,
    45,
    19,
    if (addMore) ...[123, 208, 912],
  ];

  final doubled = [for (int number in randomNumbers) number * 2];

  print(doubled);
}

main() {
  collectionPlayground();
}
