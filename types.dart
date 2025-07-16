void immutableVariables() {
  final int immutableInt = 100;
  const double immutableDouble = 3.14159;

  print(immutableInt);
  print(immutableDouble);

  final interpolatedInteger = 10;
  final interpolatedDouble = 20.5;

  print(interpolatedInteger);
  print(interpolatedDouble);

  const aFullySealedVariable = true;
  print(aFullySealedVariable);
}

void typeInterpolation() {
  var anInteger = 42;
  var aDouble = 27.6;
  var aBoolean = true;
  var aString = "Hello, Dart!";

  print(anInteger.runtimeType); // int
  print(anInteger);
  print(aDouble.runtimeType); // double
  print(aDouble);
  print(aBoolean.runtimeType); // bool
  print(aBoolean);
  print(aString.runtimeType); // String
  print(aString);
}

void untypedVariables() {
  dynamic something = 14.2;
  print(something.runtimeType); // double
}

void basicTypes() {
  int four = 4;
  double pi = 3.14;
  num someNumber = 69420;
  bool yes = true;
  bool no = false;
  int? nothing;

  nothing = 33;

  print(four);
  print(pi);
  print(someNumber);
  print(yes);
  print(no);
  print(nothing); // null
}

void main() {
  variablePlayground();
  stringPlayground();
}

void stringPlayground() {
  basicStringDeclarations();
  multiLineStrings();
  combiningStrings();
}

void combiningStrings() {
  traditionalConcatenation();
  modernInterpolation();
}

void modernInterpolation() {
  final year = 2023;
  final interpolated = 'Dart was announced in $year.';
  print(interpolated);

  final age = 33;
  final howOld = 'I am $age ${age == 1 ? 'year' : 'years'} old.';
  print(howOld);
}

void traditionalConcatenation() {
  final hello = 'Hello';
  final world = 'World';

  final combined = hello + ' ' + world + '!';
  print(combined);

  List fruits = ['apple', 'banana', 'cherry'];
  StringBuffer buffer = StringBuffer();
  for (var fruit in fruits) {
    buffer.write(fruit);
    buffer.write(', '); // Add a comma and space after each fruit
  }
  print(buffer.toString());
}

void multiLineStrings() {
  final withEscaping = 'One fish\nTwo fish\nRed fish\nBlue fish';
  print(withEscaping);

  final hamlet = '''
To be, or not to be,
That is the question:
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles
And by opposing end them.''';
  print(hamlet);
}

void basicStringDeclarations() {
  print('Single quotes');
  final aBoldStatement = 'Dart isn\'t loosely typed!';
  print(aBoldStatement);

  print('Raw string');
  final rawString = r'Raw strings ignore escape sequences like \n and \t';
  print(rawString);

  print("Double Quotes");
  final aMoreMildOpinion = "Dart is a strongly typed language.";
  print(aMoreMildOpinion);

  final mixAndMatch = 'You can use both "double" and \'single\' quotes.';
  print(mixAndMatch);
}

void variablePlayground() {
  basicTypes();
  untypedVariables();
  typeInterpolation();
  immutableVariables();
  print("Variable playground complete.");
}
