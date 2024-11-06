part of './../../../core/helpers/export_manager/export_manager.dart';

class UpcomingMoviesWidget extends StatelessWidget {
  const UpcomingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.upcomingState != current.upcomingState,
      builder: (context, state) {
        if (state.upcomingState == RequestState.loaded) {
          state.upcomingMovies.shuffle(Random());
          return BuildContentMovies(
            showFetchError: state.upcomingState == RequestState.fetchMoreError,
            movies: state.upcomingMovies,
            title: AppString.upcoming,
            isLoading: state.upcomingState == RequestState.loading,
            addEvent: () {
              context.read<MoviesBloc>().add(GetUpcomingMoviesEvent());
            },
          );
        } else {
          return BuildErrorMessage(errorMessage: state.upcomingMessage);
        }
      },
    );
  }
}
