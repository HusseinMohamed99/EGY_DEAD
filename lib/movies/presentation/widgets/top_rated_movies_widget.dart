part of './../../../core/helpers/export_manager/export_manager.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.topRatedStates != current.topRatedStates,
      builder: (context, state) {
        if (state.topRatedStates == RequestState.loaded) {
          state.topRatedMovies.shuffle(Random());
          return BuildContentMovies(
            movies: state.topRatedMovies,
            title: AppString.topRated,
            isLoading: state.topRatedStates == RequestState.loading,
          );
        } else {
          return BuildErrorMessage(errorMessage: state.topRatedMessage);
        }
      },
    );
  }
}
