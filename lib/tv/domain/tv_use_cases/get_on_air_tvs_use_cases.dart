part of '../../../core/helpers/export_manager/export_manager.dart';

class GetOnTheAirTvsUseCase extends GenericUseCase<List<Tvs>, NoParameters> {
  GetOnTheAirTvsUseCase({required this.baseTvRepository});
  final BaseTvRepository baseTvRepository;

  @override
  Future<Either<Failure, List<Tvs>>> call(NoParameters parameters) async {
    return await baseTvRepository.getOnTheAirTv();
  }
}
