part of './../../core/helpers/export_manager/export_manager.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<ChangeCurrentIndexEvent>(_changeCurrentIndex);
  }

  FutureOr<void> _changeCurrentIndex(
      ChangeCurrentIndexEvent event, Emitter<MainState> emit) {
    emit(
      MainState(
        currentIndex: event.currentIndex,
      ),
    );
  }
}
