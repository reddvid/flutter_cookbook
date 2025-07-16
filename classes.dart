class Name {
  final String firstName;
  final String lastName;
  Name(this.firstName, this.lastName);

  @override
  String toString() {
    return '$firstName $lastName';
  }
}

class OfficialName extends Name {
  final String _title;

  OfficialName(this._title, String firstName, String lastName)
    : super(firstName, lastName);

  @override
  String toString() {
    return '$_title. ${super.toString()}';
  }
}

void classPlayground() {
  final name = OfficialName('Engr', 'David', 'Ballesteros');
  final message = name.toString();
  print(message);
}

main() {
  classPlayground();
}
