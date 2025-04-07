// aqui creo la clase SuperheroDetailsResponse que es la que me va a devolver la api
class SuperheroDetailsResponse {
  final String id;
  final String name;
  final String url;
  final String realName;
  final PowerstatsResponse powerstats;

  // aqui creo el constructor de la clase SuperheroDetailsResponse
  // y le paso los parametros que me va a devolver la api
  SuperheroDetailsResponse({
    required this.id,
    required this.name,
    required this.url,
    required this.realName,
    required this.powerstats,
  });

  // aqui creo el factory que me va a devolver la api
  // y le paso los parametros que me va a devolver la api
  factory SuperheroDetailsResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroDetailsResponse(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"],
      realName: json["biography"]["full-name"],
      powerstats: PowerstatsResponse.fromJson(json["powerstats"]),
    );
  }
}

// aqui creo la clase PowerstatsResponse que es la que me va a devolver la api
// y le paso los parametros que me va a devolver la api
class PowerstatsResponse {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  // aqui creo el constructor de la clase PowerstatsResponse
  // y le paso los parametros que me va a devolver la api
  PowerstatsResponse({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });
  // aqui creo el factory que me va a devolver la api
  // y le paso los parametros que me va a devolver la apis
  factory PowerstatsResponse.fromJson(Map<String, dynamic> json) {
    return PowerstatsResponse(
      intelligence: json["intelligence"],
      strength: json["strength"],
      speed: json["speed"],
      durability: json["durability"],
      power: json["power"],
      combat: json["combat"],
    );
  }
}
