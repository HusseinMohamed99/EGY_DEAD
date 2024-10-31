part of './../../../core/helpers/export_manager/export_manager.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tvs>>> getOnTheAirTv();

  Future<Either<Failure, List<Tvs>>> getAiringTodayTvs();

  Future<Either<Failure, List<Tvs>>> getPopularTvs();

  Future<Either<Failure, List<Tvs>>> getTopRatedTvs();

  Future<Either<Failure, TvDetails>> getTvDetails(
      TvsDetailsParameters parameters);

  Future<Either<Failure, List<TvsRecommendation>>> getTvRecommendation(
      TvRecommendationParameters parameters);

  Future<Either<Failure, List<TvsSimilar>>> getTvSimilar(
      TvSimilarParameters parameters);
}
