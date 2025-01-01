import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
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
    required super.color,
  });

  factory ViewedArticleModel.fromJson(Map<String, dynamic> json) {
    final List<Color> colors = [AppColors.blue, AppColors.yellow, AppColors.pink];

    return ViewedArticleModel(
      color: colors[Random().nextInt(3)],
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
