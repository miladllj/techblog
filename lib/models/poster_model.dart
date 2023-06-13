class ArticleModel {
  String? id;
  String? title;
  String? image;

  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
  });

  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
  }
}
