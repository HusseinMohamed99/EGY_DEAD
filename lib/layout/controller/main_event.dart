part of '../../core/helpers/export_manager/export_manager.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrentIndexEvent extends MainEvent {
  const ChangeCurrentIndexEvent(this.currentIndex);
  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}
