part of '../../../core/helpers/export_manager/export_manager.dart';

class GetAiringTodayTvsUseCase extends GenericUseCase<List<Tvs>, NoParameters> {
  GetAiringTodayTvsUseCase({required this.baseTvRepository});
  final BaseTvRepository baseTvRepository;

  @override
  Future<Either<Failure, List<Tvs>>> call(NoParameters parameters) async {
    return await baseTvRepository.getAiringTodayTvs();
  }
}
