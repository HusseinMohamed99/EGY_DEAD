import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_recommendation_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc.dart';

final sl = GetIt.instance;
class ServiceLocator {
  void init  ( ){
    ///Bloc
    ///
    /// new object from MovieBloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));

    /// Use cases

    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMovieRepository: sl()));

    sl.registerLazySingleton(
        () => GetMovieRecommendationUseCase(baseMovieRepository: sl()));

    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}