import 'dart:convert';

import 'package:http/http.dart';

import 'person.dart';

class PersonRepository {
  final Client client;

  PersonRepository({required this.client});

  Future<List<Person>> getPerson() async {
    final response = await client.get(Uri.parse("https://6140bdba357db50017b3d87d.mockapi.io/person"));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map<Person>((data) => Person.fromMap(data)).toList();
    } else {
      throw Exception("Error na rquisição");
    }
  }
}
