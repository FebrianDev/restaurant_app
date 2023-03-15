class CustomerReviewResponse {
  final bool error;
  final String success;

  CustomerReviewResponse(this.error, this.success);

  factory CustomerReviewResponse.fromJson(Map<String, dynamic> json) {
    return CustomerReviewResponse(json["error"], json["success"]);
  }
}
