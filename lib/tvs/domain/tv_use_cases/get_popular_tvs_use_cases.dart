part of './../../../core/helpers/export_manager/export_manager.dart';

class GetPopularTvsUseCase extends GenericUseCase<List<Tvs>, NoParameters> {
  final BaseTvRepository baseTvRepository;

  GetPopularTvsUseCase({required this.baseTvRepository});

  @override
  Future<Either<Failure, List<Tvs>>> call(NoParameters parameters) async {
    return await baseTvRepository.getPopularTvs();
  }
}
