part of '../../../core/helpers/export_manager/export_manager.dart';

class GetTvRecommendationUseCase extends GenericUseCase<List<TvsRecommendation>,
    TvRecommendationParameters> {
  GetTvRecommendationUseCase({required this.baseTvRepository});
  final BaseTvRepository baseTvRepository;

  @override
  Future<Either<Failure, List<TvsRecommendation>>> call(
      TvRecommendationParameters parameters) async {
    return await baseTvRepository.getTvRecommendation(parameters);
  }
}

class TvRecommendationParameters extends Equatable {
  const TvRecommendationParameters({required this.tvID});
  final int tvID;

  @override
  List<Object> get props => [tvID];
}
