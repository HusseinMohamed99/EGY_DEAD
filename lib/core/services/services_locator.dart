part of './../helpers/export_manager/export_manager.dart';

final sl = GetIt.instance;

Future<void> serviceLocator() async {
  sl.registerFactory(() => InternetCubit());
  sl.registerFactory(() => MainBloc());

  /// TVS =>
  /// TVS Bloc
  sl.registerFactory(() => TvsBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => TvsDetailsBloc(sl(), sl(), sl()));

  /// TVS Use Cases
  sl.registerLazySingleton(() => GetOnTheAirTvsUseCase(baseTvRepository: sl()));
  sl.registerLazySingleton(
      () => GetAiringTodayTvsUseCase(baseTvRepository: sl()));

  sl.registerLazySingleton(() => GetPopularTvsUseCase(baseTvRepository: sl()));
  sl.registerLazySingleton(() => GetTopRatedTvsUseCase(baseTvRepository: sl()));
  sl.registerLazySingleton(() => GetTvsDetailsUseCase(baseTvsRepository: sl()));

  sl.registerLazySingleton(
      () => GetTvRecommendationUseCase(baseTvRepository: sl()));
  sl.registerLazySingleton(() => GetTvSimilarUseCase(baseTvRepository: sl()));

  /// TVS Repository
  sl.registerLazySingleton<BaseTvRepository>(
      () => TvsRepository(baseTvRemoteDataSource: sl()));

  /// TVS Data Source
  sl.registerLazySingleton<BaseTvRemoteDataSource>(() => TvRemoteDataSource());

  /// MOVIES =>
  /// Movies Bloc
  sl.registerFactory<MoviesBloc>(() => MoviesBloc(
        sl(),
        sl(),
        sl(),
        sl(),
      ));
  sl.registerFactory(() => MoviesDetailsBloc(sl(), sl(), sl()));

  /// Movies Use Cases
  sl.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(baseMovieRepository: sl()));

  sl.registerLazySingleton(
      () => GetUpcomingMoviesUseCase(baseMovieRepository: sl()));

  sl.registerLazySingleton(
      () => GetPopularMoviesUseCase(baseMovieRepository: sl()));
  sl.registerLazySingleton(
      () => GetAllPopularMoviesUseCase(baseMovieRepository: sl()));

  sl.registerLazySingleton(
      () => GetMovieDetailsUseCase(baseMovieRepository: sl()));

  sl.registerLazySingleton(
      () => GetMovieRecommendationUseCase(baseMovieRepository: sl()));
  sl.registerLazySingleton(
      () => GetMovieSimilarUseCase(baseMovieRepository: sl()));
  sl.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(baseMovieRepository: sl()));
  sl.registerLazySingleton(
      () => GetAllTopRatedMoviesUseCase(baseMovieRepository: sl()));

  /// Movies Repository
  sl.registerLazySingleton<MovieDataRepository>(
      () => MoviesRepository(remoteMovieDataSource: sl()));

  /// Movies Data Source
  sl.registerLazySingleton<RemoteMovieDataSource>(
      () => MovieRemoteDataSource());

  /// Search =>
  /// Search Bloc
  sl.registerFactory(() => SearchBloc(sl()));

  /// Search UseCase
  sl.registerLazySingleton(() => SearchUseCase(baseSearchRepository: sl()));

  /// Search Repository
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(baseSearchRemoteDataSource: sl()));

  /// Search Data Source
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl());
}
