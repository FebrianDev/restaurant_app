class CustomerReviewPost {
  final String id;
  final String name;
  final String review;

  CustomerReviewPost(this.id, this.name, this.review);

  factory CustomerReviewPost.fromJson(Map<String, dynamic> json) {
    return CustomerReviewPost(json["id"], json["name"], json["review"]);
  }
}
