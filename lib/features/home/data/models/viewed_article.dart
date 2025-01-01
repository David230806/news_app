import 'package:news_app/features/home/domain/entity/viewed_article.dart';

class ViewedArticleModel extends ViewedArticleEntity {
  ViewedArticleModel({
    required super.url,
    required super.section,
    required super.byline,
    required super.type,
    required super.title,
    required super.abstract,
    required super.publishedDate,
    required super.source,
    required super.id,
  });

  factory ViewedArticleModel.fromJson(Map<String, dynamic> json) {
    return ViewedArticleModel(
      url: json['url'],
      section: json['section'],
      byline: json['byline'],
      type: json['type'],
      title: json['title'],
      abstract: json['abstract'],
      publishedDate: json['published_date'],
      source: json['source'],
      id: json['id'],
    );
  }
}
