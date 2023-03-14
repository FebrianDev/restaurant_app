class RestaurantResponse {
  final List<dynamic> restaurants;

  RestaurantResponse(this.restaurants);

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantResponse(json["restaurants"]);
  }
}
