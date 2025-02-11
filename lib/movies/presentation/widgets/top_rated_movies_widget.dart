part of './../../../core/helpers/export_manager/export_manager.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.topRatedStates != current.topRatedStates,
      builder: (context, state) {
        if (state.topRatedStates == RequestState.loading) {
          return BuildContentMovies(
            isLoading: state.topRatedStates == RequestState.loading,
            movieItems: MovieSeeMoreModel(
              fetchData: false,
              movies: state.topRatedMovies,
              title: AppString.topRated,
              addEvent: () {
                context.read<MoviesBloc>().add(FetchMoreTopRatedMoviesEvent());
              },
            ),
          ).skeletonize();
        } else if (state.topRatedStates == RequestState.loaded) {
          state.topRatedMovies.shuffle(Random());
          return BuildContentMovies(
            isLoading: state.topRatedStates == RequestState.loading,
            movieItems: MovieSeeMoreModel(
              fetchData: false,
              movies: state.topRatedMovies,
              title: AppString.topRated,
              addEvent: () {
                context.read<MoviesBloc>().add(FetchMoreTopRatedMoviesEvent());
              },
            ),
          );
        } else if (state.topRatedStates == RequestState.fetchData) {
          state.topRatedMovies.shuffle(Random());
          return BuildContentMovies(
            isLoading: state.topRatedStates == RequestState.loading,
            movieItems: MovieSeeMoreModel(
              fetchData: true,
              movies: state.topRatedMovies,
              title: AppString.topRated,
              addEvent: () {
                context.read<MoviesBloc>().add(FetchMoreTopRatedMoviesEvent());
              },
            ),
          );
        } else {
          return BuildErrorMessage(errorMessage: state.topRatedMessage);
        }
      },
    );
  }
}
