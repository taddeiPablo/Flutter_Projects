//
import 'package:superhero_app/data/model/superhero_details_response.dart';

class SuperHeroResponse {
  //
  final String response;
  final List<SuperheroDetailsResponse> result;
  //
  SuperHeroResponse({required this.response, required this.result});

  //
  factory SuperHeroResponse.fromJson(Map<String, dynamic> json) {
    var list = json["results"] as List;
    List<SuperheroDetailsResponse> heroList =
        list.map((hero) => SuperheroDetailsResponse.fromJson(hero)).toList();

    return SuperHeroResponse(response: json["response"], result: heroList);
  }
}
