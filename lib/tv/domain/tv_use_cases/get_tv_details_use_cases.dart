part of '../../../core/helpers/export_manager/export_manager.dart';

class GetTvsDetailsUseCase
    extends GenericUseCase<TvDetails, TvsDetailsParameters> {
  GetTvsDetailsUseCase({required this.baseTvsRepository});
  final BaseTvRepository baseTvsRepository;

  @override
  Future<Either<Failure, TvDetails>> call(
      TvsDetailsParameters parameters) async {
    return await baseTvsRepository.getTvDetails(parameters);
  }
}

class TvsDetailsParameters extends Equatable {
  const TvsDetailsParameters({required this.tvsID});
  final int tvsID;

  @override
  List<Object> get props => [tvsID];
}
