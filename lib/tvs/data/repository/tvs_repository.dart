part of './../../../core/helpers/export_manager/export_manager.dart';

class TvsRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvsRepository({required this.baseTvRemoteDataSource});

  @override
  Future<Either<Failure, List<Tvs>>> getOnTheAirTv() async {
    final result = await baseTvRemoteDataSource.getOnTheAirTvs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getAiringTodayTvs() async {
    final result = await baseTvRemoteDataSource.getAiringTodayTvs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getPopularTvs() async {
    final result = await baseTvRemoteDataSource.getPopularTvs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getTopRatedTvs() async {
    final result = await baseTvRemoteDataSource.getTopRatedTvs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(
      TvsDetailsParameters parameters) async {
    final result = await baseTvRemoteDataSource.getTvDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvsRecommendation>>> getTvRecommendation(
      TvRecommendationParameters parameters) async {
    final result = await baseTvRemoteDataSource.getTvRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvsSimilar>>> getTvSimilar(
      TvSimilarParameters parameters) async {
    final result = await baseTvRemoteDataSource.getTvSimilar(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
