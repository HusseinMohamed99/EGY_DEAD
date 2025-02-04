part of './../../core/helpers/export_manager/export_manager.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrentIndexEvent extends MainEvent {
  final int currentIndex;

  const ChangeCurrentIndexEvent(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
