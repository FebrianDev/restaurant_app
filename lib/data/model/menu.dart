class Menu {
  List<dynamic> foods;
  List<dynamic> drinks;

  Menu(this.foods, this.drinks);

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(json["foods"], json["drinks"]);
  }
}
