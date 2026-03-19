import "dart:convert";

import "package:chatperlipopette/utils/cat.dart";
import "package:http/http.dart" as http;

Future<Cat> fetchCat(String id) async {
  final response = await http.get(
    Uri.parse('https://api.thecatapi.com/v1/breeds/$id'),
  );

  if (response.statusCode == 200) {
    return Cat.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception("Failed to load cat data");
  }
}

Future<List<Cat>> fetchCatsList({int? limit, String? query}) async {
  String url = 'https://api.thecatapi.com/v1/breeds?';
  if (limit != null) url = 'https://api.thecatapi.com/v1/breeds?limit=$limit';
  if (query != null && query != "") url = 'https://api.thecatapi.com/v1/breeds/search?q=$query';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final items = jsonDecode(response.body) as List<dynamic>;
    final cats = <Cat>[];

    for (final item in items) {
      if (item is! Map<String, dynamic>) continue;
      try {
        cats.add(Cat.fromJson(item));
      } on FormatException {
        // Ignore invalid records instead of failing the entire response.
      }
    }

    return cats;
  } else {
    throw Exception("Failed to load cat data");
  }
}
