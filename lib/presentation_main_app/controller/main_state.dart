part of './../../core/helpers/export_manager/export_manager.dart';

class MainState extends Equatable {
  MainState({this.currentIndex = 0});

  final int currentIndex;
  final List<Widget> screens = [
    BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent())
        ..add(GetUpcomingMoviesEvent()),
      child: const MoviesScreen(),
    ),
    BlocProvider(
      create: (context) => sl<TvsBloc>()
        ..add(GetOnTheAirTvsEvent())
        ..add(GetAiringTodayTvsEvent())
        ..add(GetPopularTvsEvent())
        ..add(GetTopRatedTvsEvent()),
      child: const TvsScreen(),
    ),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  @override
  List<Object> get props => [
        currentIndex,
        screens,
      ];
}
