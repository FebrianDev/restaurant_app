class Food {
  final String name;

  Food(this.name);

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(json['name']);
  }
}
