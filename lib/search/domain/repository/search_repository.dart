part of './../../../core/helpers/export_manager/export_manager.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResultItem>>> search(String title);
}
