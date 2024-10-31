part of './../../core/helpers/export_manager/export_manager.dart';

// A Cubit (a state management class) to manage internet connectivity.
class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();

  // Subscription to monitor changes in internet connectivity.
  StreamSubscription? _connectivitySubscription;

  // Constructor for the InternetCubit class.
  InternetCubit() : super(InternetState.initial) {
// Start listening to changes in connectivity when an instance is created.
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        // If no mobile or Wi-Fi connectivity is detected, emit 'lost' state.
        emit(InternetState.lost);
      } else {
        // If mobile or Wi-Fi connectivity is detected, emit 'gained' state.
        emit(InternetState.gained);
      }
    });
  }

  @override
  Future<void> close() {
    // Cancel the connectivity subscription when this Cubit is closed.
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
