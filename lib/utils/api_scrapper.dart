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

Future<List<Cat>> fetchCatsList(int limit) async {
  final response = await http.get(
    Uri.parse('https://api.thecatapi.com/v1/breeds?limit=$limit'),
  );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List<dynamic>)
        .map((json) => Cat.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception("Failed to load cat data");
  }
}
