part of '../../../core/helpers/export_manager/export_manager.dart';

class GetPopularTvsUseCase extends GenericUseCase<List<Tvs>, NoParameters> {
  GetPopularTvsUseCase({required this.baseTvRepository});
  final BaseTvRepository baseTvRepository;

  @override
  Future<Either<Failure, List<Tvs>>> call(NoParameters parameters) async {
    return await baseTvRepository.getPopularTvs();
  }
}
