part of './../../../../core/helpers/export_manager/export_manager.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class GetSearchResultsEvent extends SearchEvent {
  final String title;

  const GetSearchResultsEvent(this.title);

  @override
  List<Object?> get props => [title];
}
