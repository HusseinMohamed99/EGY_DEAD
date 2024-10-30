import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/tvs/domain/entities/tv_details.dart';
import 'package:movies_app/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app/tvs/domain/entities/tv_similar.dart';
import 'package:movies_app/tvs/domain/entities/tvs.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_tv_details_use_cases.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_tvs_recommendation_use_cases.dart';
import 'package:movies_app/tvs/domain/tv_use_cases/get_tvs_similar_use_cases.dart';

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
