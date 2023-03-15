class DetailRestaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String address;
  final dynamic menus;
  final num rating;
  final List<dynamic> customerReviews;

  DetailRestaurant(this.id, this.name, this.description, this.pictureId,
      this.city, this.address, this.menus, this.rating, this.customerReviews);

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) {
    return DetailRestaurant(
        json["id"],
        json["name"],
        json["description"],
        json["pictureId"],
        json["city"],
        json["address"],
        json["menus"],
        json["rating"],
        json["customerReviews"]);
  }
}
