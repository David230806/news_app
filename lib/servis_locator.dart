import 'package:get_it/get_it.dart';
import 'package:news_app/features/home/data/repository/most_viewed_repository_impl.dart';
import 'package:news_app/features/home/domain/repository/most_viewed_repository.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  sl.registerSingleton<MostViewedRepository>(MostViewedRepositoryImpl());
}