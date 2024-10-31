part of './../../core/helpers/export_manager/export_manager.dart';

class MainState extends Equatable {
  MainState({this.currentIndex = 0});

  final int currentIndex;
  final List<Widget> screens = [
    const MoviesScreen(),
    const TvsScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  @override
  List<Object> get props => [
        currentIndex,
        screens,
      ];
}
