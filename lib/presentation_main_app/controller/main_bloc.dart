part of './../../core/helpers/export_manager/export_manager.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<ChangeCurrentIndexEvent>(_changeCurrentIndex);
  }

  static MainBloc get(context) => BlocProvider.of(context);

  FutureOr<void> _changeCurrentIndex(
      ChangeCurrentIndexEvent event, Emitter<MainState> emit) {
    emit(
      MainState(
        currentIndex: event.currentIndex,
      ),
    );
  }
}
