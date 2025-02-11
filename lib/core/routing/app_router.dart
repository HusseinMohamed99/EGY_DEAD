part of './../helpers/export_manager/export_manager.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<InternetCubit>(),
            child: const HomePage(),
          ),
        );

      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );

      case Routes.moviesScreen:
        return MaterialPageRoute(
          builder: (_) => const MoviesScreen(),
        );
      case Routes.tvsScreen:
        return MaterialPageRoute(
          builder: (_) => const TvsScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<SearchBloc>(),
            child: const SearchScreen(),
          ),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );

      case Routes.supportScreen:
        return MaterialPageRoute(
          builder: (_) => const SupportScreen(),
        );
      case Routes.movieDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(
            movieID: arguments as int,
          ),
        );
      case Routes.movieSeeMoreScreen:
        return MaterialPageRoute(
          builder: (_) => MovieSeeMoreScreen(
            movieItems: arguments as MovieSeeMoreModel,
          ),
        );
    }
    return null;
  }
}
