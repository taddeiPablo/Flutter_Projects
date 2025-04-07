// importo las librerias necesarias
import 'dart:convert';
import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:http/http.dart' as http;

// aqui creo la clase repository
// que se encargara de hacer la peticion a la api
class Repository {
  // aqui creo el metodo fetchSuperheroInfo
  // que recibe un string como parametro
  // y devuelve un Future de tipo SuperHeroResponse
  // que es la clase que contiene la respuesta de la api
  // el metodo hace una peticion a la api de superheroes
  // y devuelve la respuesta en formato json
  // esta funcionn es de tipo asincrona.
  Future<SuperHeroResponse> fetchSuperheroInfo(String name) async {
    // aqui armo la peticion a la apo
    // usando el nombre del superheroe que me pasaron por parametro
    // y la api key que me dieron para poder hacer la peticion
    // la api key es la que me permite acceder a la api
    // a su vez tambien armo la uri parse que es la que me permite hacer la peticion.
    final response = await http.get(
      Uri.parse(
        "https://superheroapi.com/api/34426f80f3d4b4646b74e2bdc20cdced/search/$name",
      ),
    );
    // aqui verifico si la respuesta es correcta
    // si es correcta devuelvo la respuesta en formato json
    if (response.statusCode == 200) {
      // aqui convierto la respuesta en formato json
      var decodedJson = jsonDecode(response.body);
      // aqui imprimo la respuesta en formato json
      SuperHeroResponse sResponse = SuperHeroResponse.fromJson(decodedJson);
      return sResponse;
    } else {
      throw Exception("Ha ocurrido un error");
    }
  }
}
