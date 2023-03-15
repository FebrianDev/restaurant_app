class DetailRestaurantResponse {
  final dynamic restaurant;

  DetailRestaurantResponse(this.restaurant);

  factory DetailRestaurantResponse.fromJson(Map<String, dynamic> json) {
    return DetailRestaurantResponse(json["restaurant"]);
  }
}
