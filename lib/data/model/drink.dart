class Drink{
  final String name;

  Drink(this.name);

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(json['name']);
  }
}