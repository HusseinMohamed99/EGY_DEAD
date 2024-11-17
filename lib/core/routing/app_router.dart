part of './../helpers/export_manager/export_manager.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )

    /// final arguments = settings.arguments;

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
          builder: (_) => MainScreen(),
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
    }
    return null;
  }
}
