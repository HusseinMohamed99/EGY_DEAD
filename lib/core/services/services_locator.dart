import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_all_popular_movies_use_case.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_all_top_rated_movies_use_case.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_movie_details_use_cases.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_movies_recommendation_use_cases.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_movies_similar_use_cases.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_now_playing_movies_use_cases.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_popular_movies_use_cases.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_top_rated_movies_use_cases.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_up_coming_movies_use_cases.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc.dart';
import 'package:movies_app/presentation_main_app/controller/internet_bloc.dart';
import 'package:movies_app/presentation_main_app/controller/main_bloc.dart';
import 'package:movies_app/search/data/data_source/search_remote_data_source.dart';
import 'package:movies_app/search/data/repository/search_repository.dart';
import 'package:movies_app/search/domain/repository/search_repository.dart';
import 'package:movies_app/search/domain/use_cases/search_use_case.dart';
import 'package:movies_app/search/presentation/controllers/search_bloc/search_bloc.dart';
import 'package:movies_app/tvs/data/data_source/tv_remote_data_source.dart';
import 'package:movies_app/tvs/data/repository/tvs_repository.dart';
import 'package:movies_app/tvs/domain/repository/base_tvs_repository.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_airing_today_tvs_use_cases.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_on_air_tvs_use_cases.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_popular_tvs_use_cases.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_top_rated_tvs_use_cases.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_tv_details_use_cases.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_tvs_recommendation_use_cases.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_tvs_similar_use_cases.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_bloc.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    sl.registerLazySingleton(() => InternetCubit());
    sl.registerLazySingleton(() => MainBloc());

    /// TVS =>
    /// TVS Bloc
    sl.registerFactory(() => TvsBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => TvsDetailsBloc(sl(), sl(), sl()));

    /// TVS Use Cases
    sl.registerLazySingleton(
        () => GetOnTheAirTvsUseCase(baseTvRepository: sl()));
    sl.registerLazySingleton(
        () => GetAiringTodayTvsUseCase(baseTvRepository: sl()));

    sl.registerLazySingleton(
        () => GetPopularTvsUseCase(baseTvRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedTvsUseCase(baseTvRepository: sl()));
    sl.registerLazySingleton(
        () => GetTvsDetailsUseCase(baseTvsRepository: sl()));

    sl.registerLazySingleton(
        () => GetTvRecommendationUseCase(baseTvRepository: sl()));
    sl.registerLazySingleton(() => GetTvSimilarUseCase(baseTvRepository: sl()));

    /// TVS Repository
    sl.registerLazySingleton<BaseTvRepository>(
        () => TvsRepository(baseTvRemoteDataSource: sl()));

    /// TVS Data Source
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    /// MOVIES =>
    /// Movies Bloc
    sl.registerFactory(() => MoviesBloc(
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
}
