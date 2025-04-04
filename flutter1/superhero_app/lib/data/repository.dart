import 'dart:convert';

import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:http/http.dart' as http;

//
class Repository {
  //
  Future<SuperHeroResponse> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse(
        "https://superheroapi.com/api/34426f80f3d4b4646b74e2bdc20cdced/search/$name",
      ),
    );
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      SuperHeroResponse sResponse = SuperHeroResponse.fromJson(decodedJson);
      return sResponse;
    } else {
      throw Exception("Ha ocurrido un error");
    }
  }
}
