part of './../helpers/export_manager/export_manager.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.moviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<MoviesBloc>(),
            child: const MoviesScreen(),
          ),
        );
    }
    return null;
  }
}
