import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/widgets/base_text.dart';
import 'package:news_app/features/home/presentation/bloc/articles_manager/articles_manager_cubit.dart';
import 'package:news_app/features/home/presentation/bloc/viewed_articles/viewed_articles_bloc.dart';
import 'package:news_app/features/home/presentation/widgets/article_card.dart';

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
    // Initialize AnimationController for rotation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the Tween for the rotation animation
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseText(
          "News",
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: BlocConsumer<ViewedArticlesBloc, ViewedArticlesState>(
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
          print("Rotation value: ${_rotationAnimation.value}");
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
                        offset: Offset(_rotationAnimation.value * 5, _rotationAnimation.value * 3),
                        child: Transform.rotate(
                          angle: _rotationAnimation.value * (3.141592653589793 / 180),
                          child:
                              ArticleCard(article: context.watch<ArticlesManagerCubit>().state[1]),
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
                    onSwipeLeft: (finalPosition) {
                      context.read<ArticlesManagerCubit>().swapArticle();
                      _rotationController.forward(from: 0);
                    },
                    onSwipeRight: (finalPosition) {
                      context.read<ArticlesManagerCubit>().swapArticle();
                      _rotationController.forward(from: 0);
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
    );
  }
}
