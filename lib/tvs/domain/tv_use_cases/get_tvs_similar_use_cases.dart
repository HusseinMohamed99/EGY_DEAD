part of './../../../core/helpers/export_manager/export_manager.dart';

class GetTvSimilarUseCase
    extends GenericUseCase<List<TvsSimilar>, TvSimilarParameters> {
  final BaseTvRepository baseTvRepository;

  GetTvSimilarUseCase({required this.baseTvRepository});

  @override
  Future<Either<Failure, List<TvsSimilar>>> call(
      TvSimilarParameters parameters) async {
    return await baseTvRepository.getTvSimilar(parameters);
  }
}

class TvSimilarParameters extends Equatable {
  final int tvID;

  const TvSimilarParameters({required this.tvID});

  @override
  List<Object> get props => [tvID];
}
