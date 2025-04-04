class SuperheroDetailsResponse {
  final String id;
  final String name;
  final String url;

  SuperheroDetailsResponse({
    required this.id,
    required this.name,
    required this.url,
  });

  factory SuperheroDetailsResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroDetailsResponse(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"],
    );
  }
}
