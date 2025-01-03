import 'package:flutter/material.dart';
import 'package:news_app/data/models/media.dart';

class ViewedArticleEntity {
  final String url;
  final String section;
  final String byline;
  final String type;
  final String title;
  final String abstract;
  final String source;
  final String publishedDate;
  final int id;
  final Color color;
  List<MediaModel> media;

  ViewedArticleEntity({
    required this.url,
    required this.section,
    required this.byline,
    required this.type,
    required this.title,
    required this.abstract,
    required this.publishedDate,
    required this.source,
    required this.id,
    required this.color,
    required this.media,
  });
}
