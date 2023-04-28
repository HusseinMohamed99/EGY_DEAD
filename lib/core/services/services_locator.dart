import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_recommendation_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_similar_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_up_coming_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc.dart';
import 'package:movies_app/tvs/data/datasource/tv_remote_data_source.dart';
import 'package:movies_app/tvs/data/repository/tvs_repository.dart';
import 'package:movies_app/tvs/domain/repository/base_tvs_repository.dart';
import 'package:movies_app/tvs/domain/usecases/get_airing_today_tvs_usecases.dart';
import 'package:movies_app/tvs/domain/usecases/get_on_air_tvs_usecases.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// TVS =>
    /// TVS Bloc
    sl.registerFactory(() => TvsBloc(sl(), sl()));

    /// TVS Use Cases
    sl.registerLazySingleton(
        () => GetOnTheAirTvsUseCase(baseTvRepository: sl()));
    sl.registerLazySingleton(
        () => GetAiringTodayTvsUseCase(baseTvRepository: sl()));

    /// TVS Repository
    sl.registerLazySingleton<BaseTvRepository>(
        () => TvsRepository(baseTvRemoteDataSource: sl()));

    /// TVS Data Source
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    /// MOVIES =>
    /// Movies Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl(), sl()));

    /// Movies Use Cases
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
        () => GetUpcomingMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
        () => GetMovieRecommendationUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieSimilarUseCase(baseMovieRepository: sl()));

    /// Movies Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    /// Movies Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
