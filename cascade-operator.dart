class UrlBuilder {
  String? _scheme;
  String? _host;
  String? _path;

  UrlBuilder setScheme(String value) {
    _scheme = value;
    return this;
  }

  UrlBuilder setHost(String value) {
    _host = value;
    return this;
  }

  UrlBuilder setPath(String value) {
    _path = value;
    return this;
  }

  String build() {
    assert(_scheme != null, 'Scheme must be set');
    assert(_host != null, 'Host must be set');
    assert(_path != null, 'Path must be set');

    return '$_scheme://$_host/${_path ?? ''}';
  }
}

class UrlBuilderAgain {
  String scheme = '';
  String host = '';
  List<String> routes = [];

  @override
  String toString() {
    final paths = [host, if (routes != []) ...routes];
    final path = paths.join('/');
    return '$scheme://$path';
  }
}

void cascadePlayground() {
  final url = UrlBuilderAgain()
    ..scheme = 'https'
    ..host = 'example.com'
    ..routes = ['api', 'v1', 'resource'];

  print(url); // Output: https://example.com/api/v1/resource

  final numbers = [423, 672, 912, 345, 678]
    ..insert(0, 211)
    ..sort((a, b) => a.compareTo(b));

  print('The largest number in the list is ${numbers.last}');
}

void main() {
  final url = UrlBuilder()
      .setScheme('https')
      .setHost('example.com')
      .setPath('api/v1/resource')
      .build();

  cascadePlayground();

  print(url); // Output: https://example.com/api/v1/resource
}
