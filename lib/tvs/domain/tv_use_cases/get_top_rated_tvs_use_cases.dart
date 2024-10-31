part of './../../../core/helpers/export_manager/export_manager.dart';

class GetTopRatedTvsUseCase extends GenericUseCase<List<Tvs>, NoParameters> {
  final BaseTvRepository baseTvRepository;

  GetTopRatedTvsUseCase({required this.baseTvRepository});

  @override
  Future<Either<Failure, List<Tvs>>> call(NoParameters parameters) async {
    return await baseTvRepository.getTopRatedTvs();
  }
}
