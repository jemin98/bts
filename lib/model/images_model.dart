class ImageData {
  String? status;
  int? count;
  int? pages;
  String? count_total;
  List? posts;

  ImageData({
    this.count,
    this.count_total,
    this.pages,
    this.posts,
    this.status,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
        count: json["count"],
        count_total: json["count_total"],
        pages: json["pages"],
        posts: json["posts"],
        status: json["status"]);
  }
}
