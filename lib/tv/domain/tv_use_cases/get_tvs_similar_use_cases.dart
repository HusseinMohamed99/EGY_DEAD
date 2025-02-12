part of '../../../core/helpers/export_manager/export_manager.dart';

class GetTvSimilarUseCase
    extends GenericUseCase<List<TvsSimilar>, TvSimilarParameters> {
  GetTvSimilarUseCase({required this.baseTvRepository});
  final BaseTvRepository baseTvRepository;

  @override
  Future<Either<Failure, List<TvsSimilar>>> call(
      TvSimilarParameters parameters) async {
    return await baseTvRepository.getTvSimilar(parameters);
  }
}

class TvSimilarParameters extends Equatable {
  const TvSimilarParameters({required this.tvID});
  final int tvID;

  @override
  List<Object> get props => [tvID];
}
