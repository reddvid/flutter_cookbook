void main() {
  var (String name, int age) = getPerson({'name': 'Alice', 'age': 30});
  print('Name: $name, Age: $age');
}

(String, int) getPerson(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}
