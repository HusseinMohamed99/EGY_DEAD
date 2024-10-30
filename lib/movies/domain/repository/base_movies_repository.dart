import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app/movies/domain/entities/movie_similar.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_movie_details_use_cases.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_movies_recommendation_use_cases.dart';
import 'package:movies_app/movies/domain/movie_use_cases/get_movies_similar_use_cases.dart';

abstract class MovieDataRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, List<Movies>>> getUpcomingMovies();

  Future<Either<Failure, List<Movies>>> getAllPopularMovies(int page);

  Future<Either<Failure, List<Movies>>> getAllTopRatedMovies(int page);

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<MoviesRecommendation>>> getMovieRecommendation(
      MovieRecommendationParameters parameters);

  Future<Either<Failure, List<MoviesSimilar>>> getMovieSimilar(
      MovieSimilarParameters parameters);
}
