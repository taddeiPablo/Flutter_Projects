//
class SuperheroDetailsResponse {
  final String id;
  final String name;
  final String url;
  final String realName;
  final PowerstatsResponse powerstats;

  //
  SuperheroDetailsResponse({
    required this.id,
    required this.name,
    required this.url,
    required this.realName,
    required this.powerstats,
  });

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

class PowerstatsResponse {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  PowerstatsResponse({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory PowerstatsResponse.fromJson(Map<String, dynamic> json) {
    return PowerstatsResponse(
      intelligence: json["intelligence"] == "null" ? "0" : json["intelligence"],
      strength: json["strength"] == "null" ? "0" : json["strength"],
      speed: json["speed"] == "null" ? "0" : json["speed"],
      durability: json["durability"] == "null" ? "0" : json["durability"],
      power: json["power"] == "null" ? "0" : json["power"],
      combat: json["combat"] == "null" ? "0" : json["combat"],
    );
  }
}
