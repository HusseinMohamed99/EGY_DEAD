import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/tvs/domain/entities/tvs.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tvs>>> getOnTheAirTv();

  Future<Either<Failure, List<Tvs>>> getAiringTodayTvs();

// Future<Either<Failure, List<Movies>>> getPopularMovies();
//
// Future<Either<Failure, List<Movies>>> getTopRatedMovies();
//
// Future<Either<Failure, List<Movies>>> getUpcomingMovies();
//
// Future<Either<Failure, MovieDetails>> getMovieDetails(
//     MovieDetailsParameters parameters);
//
// Future<Either<Failure, List<MoviesRecommendation>>> getMovieRecommendation(
//     MovieRecommendationParameters parameters);
//
// Future<Either<Failure, List<MoviesSimilar>>> getMovieSimilar(
//     MovieSimilarParameters parameters);
}
