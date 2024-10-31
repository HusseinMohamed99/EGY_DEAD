part of './../../../core/helpers/export_manager/export_manager.dart';

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
