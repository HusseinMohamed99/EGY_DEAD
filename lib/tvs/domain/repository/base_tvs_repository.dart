import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/tvs/domain/entities/tv_details.dart';
import 'package:movies_app/tvs/domain/entities/tvs.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_details_usecases.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tvs>>> getOnTheAirTv();

  Future<Either<Failure, List<Tvs>>> getAiringTodayTvs();

  Future<Either<Failure, List<Tvs>>> getPopularTvs();

  Future<Either<Failure, List<Tvs>>> getTopRatedTvs();

  Future<Either<Failure, TvDetails>> getTvDetails(
      TvsDetailsParameters parameters);

// Future<Either<Failure, List<MoviesRecommendation>>> getMovieRecommendation(
//     MovieRecommendationParameters parameters);
//
// Future<Either<Failure, List<MoviesSimilar>>> getMovieSimilar(
//     MovieSimilarParameters parameters);
}
