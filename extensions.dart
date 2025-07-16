extension StringExtensions on String {
  bool toBool() {
    return isNotEmpty;
  }
}

void testExtensions() {
  String emptyString = '';
  String nonEmptyString = 'Hello, World!';

  print(emptyString.toBool()); // Output: false
  print(nonEmptyString.toBool()); // Output: true
}

void main() {
  testExtensions();
}
