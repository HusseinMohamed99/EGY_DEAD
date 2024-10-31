part of './../../../../core/helpers/export_manager/export_manager.dart';

class SearchState extends Equatable {
  const SearchState({
    this.searchResults = const [],
    this.status = SearchRequestStatus.empty,
    this.message = '',
  });

  final List<SearchResultItem> searchResults;
  final SearchRequestStatus status;
  final String message;

  SearchState copyWith({
    List<SearchResultItem>? searchResults,
    SearchRequestStatus? status,
    String? message,
  }) {
    return SearchState(
      searchResults: searchResults ?? this.searchResults,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        searchResults,
        status,
        message,
      ];
}
