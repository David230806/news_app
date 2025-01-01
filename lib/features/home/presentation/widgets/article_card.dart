import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/widgets/base_text.dart';
import 'package:news_app/features/home/data/models/viewed_article.dart';

class ArticleCard extends StatelessWidget {
  final ViewedArticleModel article;
  final List<Color> colors = [AppColors.blue, AppColors.yellow, AppColors.pink];

  ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      decoration: BoxDecoration(
        color: colors[Random().nextInt(3)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Animate(
            effects: [
              FadeEffect(
                duration: 400.ms,
              )
            ],
            child: BaseText(
              article.title,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: BaseText(
                      article.byline,
                      fontSize: 18,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  BaseText(
                    article.publishedDate,
                    fontSize: 16,
                    color: AppColors.grey,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BaseText(
            article.abstract,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 6,
          )
        ],
      ),
    );
  }
}
