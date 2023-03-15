class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview(this.name, this.review, this.date);

  factory CustomerReview.fromJson(Map<String, dynamic> json){
    return CustomerReview(json["name"], json["review"], json["date"]);
  }
}