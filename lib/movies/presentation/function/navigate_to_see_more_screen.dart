part of '../../../core/helpers/export_manager/export_manager.dart';

void navigateToSeeMore({
  required BuildContext context,
  required List<Movies> movies,
  required String title,
  required Function addEvent,
  required bool showFetchError,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => sl<MoviesBloc>(),
        child: BlocBuilder<MoviesBloc, MoviesStates>(
          builder: (context, state) {
            return MovieSeeMoreScreen(
              showFetchError: showFetchError,
              movieList: movies,
              title: title,
              addEvent: () {
                addEvent();
              },
            );
          },
        ),
      ),
    ),
  );
}
