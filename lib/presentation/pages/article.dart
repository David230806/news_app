import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/utils/snackbar_controller.dart';
import 'package:news_app/core/widgets/base_text.dart';
import 'package:news_app/data/models/media.dart';
import 'package:news_app/data/models/viewed_article.dart';
import 'package:popover/popover.dart';

class ArticlePage extends StatelessWidget {
  final ViewedArticleModel article;

  const ArticlePage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: article.color,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Iconsax.arrow_circle_left,
                    ),
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        showPopover(
                          context: context,
                          backgroundColor: article.color,
                          direction: PopoverDirection.top,
                          height: 100,
                          width: 200,
                          bodyBuilder: (context) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: 200,
                                  child: InkWell(
                                    onTap: () {
                                      print(article.url);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                        vertical: 10,
                                      ),
                                      child: Center(
                                        child: BaseText("Read full"),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: 200,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();

                                      SnackBarController(context: context).showErrorSnackBar(
                                        "Your report will be seen soon",
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                        vertical: 10.0,
                                      ),
                                      child: Center(
                                        child: BaseText(
                                          "Report",
                                          color: AppColors.error,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Iconsax.menu_board,
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
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
                            width: 250,
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
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BaseText(
                    article.abstract,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  for (MediaModel media in article.media)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            media.meta.url,
                          ),
                        ),
                      ),
                      width: media.meta.width,
                      height: media.meta.height,
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
