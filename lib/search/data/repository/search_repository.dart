import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/search/data/data_source/search_remote_data_source.dart';
import 'package:movies_app/search/domain/entities/search_result_item.dart';
import 'package:movies_app/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource baseSearchRemoteDataSource;

  SearchRepositoryImpl({required this.baseSearchRemoteDataSource});

  @override
  Future<Either<Failure, List<SearchResultItem>>> search(String title) async {
    final result = await baseSearchRemoteDataSource.search(title);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
