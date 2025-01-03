import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/widgets/base_text.dart';
import 'package:news_app/core/widgets/base_textfield.dart';
import 'package:news_app/core/widgets/swipable.dart';
import 'package:news_app/presentation/bloc/articles_manager/articles_manager_cubit.dart';
import 'package:news_app/presentation/bloc/viewed_articles/viewed_articles_bloc.dart';
import 'package:news_app/presentation/widgets/article_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rotationAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 10, end: 0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0, end: 10), weight: 50),
    ]).animate(CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  bool isSwipeStarted = false;
  bool isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            isSearchActive = true;
          });
        },
        child: Container(
          width: isSearchActive ? 200 : 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.interactive,
          ),
          child: isSearchActive
              ? BaseTextfield(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearchActive = false;
                      });
                    },
                    icon: Icon(
                      Iconsax.close_circle,
                      color: AppColors.inversedPrimary,
                      size: 36,
                    ),
                  ),
                )
              : Center(
                  child: Icon(
                    Iconsax.search_normal,
                    color: AppColors.inversedPrimary,
                    size: 26,
                  ),
                ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        leadingWidth: 100,
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/NewsAppLogoPng.png",
              ),
            ),
          ),
        ),
        title: BaseText(
          "News",
          fontSize: 28,
          color: AppColors.inversedPrimary,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSearchActive = false;
            });
          },
          child: BlocConsumer<ViewedArticlesBloc, ViewedArticlesState>(
            listener: (context, state) {
              print("worl listener");
              if (state is ViewedArticlesInitial) {
                context.read<ViewedArticlesBloc>().add(GetViewedArticlesEvent(period: 1));
              }

              if (state is ViewedArticlesSuccess) {
                context.read<ArticlesManagerCubit>().initialize(state.articles);
              }
            },
            builder: (context, state) {
              if (state is ViewedArticlesSuccess) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 20,
                      ),
                      child: ArticleCard(article: context.watch<ArticlesManagerCubit>().state[2]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 20,
                      ),
                      child: AnimatedBuilder(
                        animation: _rotationAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: isSwipeStarted ? Offset.zero : Offset(10 * 5, 10 * 3),
                            child: Transform.rotate(
                              angle: isSwipeStarted ? 0 : 10 * (3.141592653589793 / 180),
                              child: ArticleCard(
                                  article: context.watch<ArticlesManagerCubit>().state[1]),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 20,
                      ),
                      child: Swipable(
                        afterSwipe: () {
                          setState(() {
                            isSwipeStarted = false;
                          });
                        },
                        onSwipeLeft: (finalPosition) {
                          context.read<ArticlesManagerCubit>().swapArticle();
                        },
                        onSwipeRight: (finalPosition) {
                          context.read<ArticlesManagerCubit>().swapArticle();
                        },
                        onSwipeCancel: (position, details) {
                          setState(() {
                            isSwipeStarted = false;
                          });
                        },
                        onSwipeStart: (details) {
                          setState(() {
                            isSwipeStarted = true;
                          });
                        },
                        horizontalSwipe: true,
                        verticalSwipe: false,
                        child: ArticleCard(
                          article: context.watch<ArticlesManagerCubit>().state[0],
                        ),
                      ),
                    ),
                  ],
                );
              }

              if (state is ViewedArticlesLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.inversedPrimary,
                  ),
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
