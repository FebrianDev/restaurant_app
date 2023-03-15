class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;

  Restaurant(this.id, this.name, this.description, this.pictureId, this.city,
      this.rating);

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      json["id"],
      json["name"],
      json["description"],
      json["pictureId"],
      json["city"],
      json["rating"],
    );
  }
}
