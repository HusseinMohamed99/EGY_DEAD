part of './../../../core/helpers/export_manager/export_manager.dart';

class GetTvsDetailsUseCase
    extends GenericUseCase<TvDetails, TvsDetailsParameters> {
  final BaseTvRepository baseTvsRepository;

  GetTvsDetailsUseCase({required this.baseTvsRepository});

  @override
  Future<Either<Failure, TvDetails>> call(
      TvsDetailsParameters parameters) async {
    return await baseTvsRepository.getTvDetails(parameters);
  }
}

class TvsDetailsParameters extends Equatable {
  final int tvsID;

  const TvsDetailsParameters({required this.tvsID});

  @override
  List<Object> get props => [tvsID];
}
