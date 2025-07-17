void main() {
  functionPlayground();
  consumeClosure();
}

void functionPlayground() {
  classicalFunctions();
  optionalParameters();
}

void printMyName(String name) {
  print('My name is $name');
}

int add(int a, int b) {
  return a + b;
}

int factorial(int number) {
  if (number <= 1) {
    return 1;
  }

  return number * factorial(number - 1);
}

void classicalFunctions() {
  printMyName('David');
  printMyName('Janice');

  final sum = add(5, 7);
  print(sum);

  print('10 Factorial is ${factorial(10)}');
}

void unnamed([String? name, int? age]) {
  final actualName = name ?? 'Unknown';
  final actualAge = age ?? 0;
  print('$actualName is $actualAge years old.');
}

void named({String? greeting, String? name}) {
  final actualGreeting = greeting ?? 'Hello';
  final actualName = name ?? 'Mystery Person';
  print('$actualGreeting, $actualName!');
}

String duplicate(String name, {int times = 1}) {
  final merged = StringBuffer(name);
  for (var i = 1; i < times; i++) {
    merged.write(' $name');
  }
  return merged.toString();
}

void optionalParameters() {
  unnamed('Huxley', 3);
  unnamed();

  named(greeting: 'Hello');
  named(name: 'David');
  named(name: 'Axel', greeting: 'Hola');

  final multiply = duplicate('Mikey', times: 3);
  print(multiply); // Mikey Mikey Mikey
}

void callbackExample(void Function(String value) callback) {
  callback('Hello from the callback!');
}

void printSomething(String value) {
  print(value);
}

typedef NumberGetter = int Function();

int powerOfTwo(NumberGetter getter) {
  return getter() * getter();
}

void consumeClosure() {
  int getFour() => 4;
  final squared = powerOfTwo(getFour);
  print('4 squared is $squared'); // 16

  callbackExample(printSomething);
}

