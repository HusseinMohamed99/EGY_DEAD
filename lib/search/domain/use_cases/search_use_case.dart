import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/search/domain/entities/search_result_item.dart';
import 'package:movies_app/search/domain/repository/search_repository.dart';

class SearchUseCase extends GenericUseCase<List<SearchResultItem>, String> {
  final SearchRepository baseSearchRepository;

  SearchUseCase({required this.baseSearchRepository});

  @override
  Future<Either<Failure, List<SearchResultItem>>> call(
      String parameters) async {
    return await baseSearchRepository.search(parameters);
  }
}
