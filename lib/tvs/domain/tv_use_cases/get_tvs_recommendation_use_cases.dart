part of './../../../core/helpers/export_manager/export_manager.dart';

class GetTvRecommendationUseCase extends GenericUseCase<List<TvsRecommendation>,
    TvRecommendationParameters> {
  final BaseTvRepository baseTvRepository;

  GetTvRecommendationUseCase({required this.baseTvRepository});

  @override
  Future<Either<Failure, List<TvsRecommendation>>> call(
      TvRecommendationParameters parameters) async {
    return await baseTvRepository.getTvRecommendation(parameters);
  }
}

class TvRecommendationParameters extends Equatable {
  final int tvID;

  const TvRecommendationParameters({required this.tvID});

  @override
  List<Object> get props => [tvID];
}
