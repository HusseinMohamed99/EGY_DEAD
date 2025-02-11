part of './../../../core/helpers/export_manager/export_manager.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        if (state.popularState == RequestState.loading) {
          return BuildContentMovies(
            isLoading: state.popularState == RequestState.loading,
            movieItems: MovieSeeMoreModel(
              fetchData: false,
              movies: state.popularMovies,
              title: AppString.popular,
              addEvent: () {
                context.read<MoviesBloc>().add(FetchMorePopularMoviesEvent());
              },
            ),
          ).skeletonize();
        } else if (state.popularState == RequestState.loaded) {
          state.popularMovies.shuffle(Random());
          return BuildContentMovies(
            isLoading: state.popularState == RequestState.loading,
            movieItems: MovieSeeMoreModel(
              fetchData: false,
              movies: state.popularMovies,
              title: AppString.popular,
              addEvent: () {
                context.read<MoviesBloc>().add(FetchMorePopularMoviesEvent());
              },
            ),
          );
        } else if (state.popularState == RequestState.fetchData) {
          state.popularMovies.shuffle(Random());
          return BuildContentMovies(
            isLoading: state.popularState == RequestState.loading,
            movieItems: MovieSeeMoreModel(
              fetchData: true,
              movies: state.popularMovies,
              title: AppString.popular,
              addEvent: () {
                context.read<MoviesBloc>().add(FetchMorePopularMoviesEvent());
              },
            ),
          );
        } else {
          return BuildErrorMessage(errorMessage: state.popularMessage);
        }
      },
    );
  }
}
