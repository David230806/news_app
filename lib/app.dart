import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_themes.dart';
import 'package:news_app/domain/repository/most_viewed_repository.dart';
import 'package:news_app/presentation/bloc/articles_manager/articles_manager_cubit.dart';
import 'package:news_app/presentation/bloc/viewed_articles/viewed_articles_bloc.dart';
import 'package:news_app/presentation/pages/home.dart';
import 'package:news_app/servis_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print("work");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ViewedArticlesBloc(sl<MostViewedRepository>())
            ..add(
              GetViewedArticlesEvent(period: 1),
            ),
        ),
        BlocProvider(
          create: (context) => ArticlesManagerCubit(),
        )
      ],
      child: MaterialApp(
        theme: AppThemes.primaryTheme,
        home: HomeScreen(),
      ),
    );
  }
}
