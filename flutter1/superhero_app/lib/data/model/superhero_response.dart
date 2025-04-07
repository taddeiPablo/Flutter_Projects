// aqui cargo las librerias necesarias
import 'package:superhero_app/data/model/superhero_details_response.dart';

// aqui creo la clase SuperHeroResponse
// que contiene la respuesta de la API
class SuperHeroResponse {
  // aqui declaro las variables que voy a usar
  // response es un String que indica si la respuesta fue correcta o no
  final String response;
  final List<SuperheroDetailsResponse> result;

  // aqui el constructor de la clase
  // que recibe la respuesta y el resultado(listado de heroes)
  SuperHeroResponse({required this.response, required this.result});

  // aqui el metodo fromJson que convierte la respuesta de la API en un objeto de la clase SuperHeroResponse
  // el metodo fromJson recibe un Map<String, dynamic> que es la respuesta de la API
  factory SuperHeroResponse.fromJson(Map<String, dynamic> json) {
    // aqui casteo el results a un tipo list
    var list = json["results"] as List;
    // aqui creo una lista de objetos de la clase SuperheroDetailsResponse
    // que contiene la lista de heroes que vienen en la respuesta de la API
    List<SuperheroDetailsResponse> heroList =
        list.map((hero) => SuperheroDetailsResponse.fromJson(hero)).toList();
    // aqui retorno un objeto de la clase SuperHeroResponse
    // que contiene la respuesta de la API y la lista de heroes
    return SuperHeroResponse(response: json["response"], result: heroList);
  }
}
