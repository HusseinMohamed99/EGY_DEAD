part of './../../../core/helpers/export_manager/export_manager.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        if (state.popularState == GetAllRequestStatus.loaded) {
          return BuildContentPopularMovies(state: state);
        } else if (state.popularState == GetAllRequestStatus.fetchMoreError) {
          return BuildContentPopularMovies(
            state: state,
            showFetchError: true,
          );
        } else {
          return _buildErrorMessage(context, state.popularMessage);
        }
      },
    );
  }

  Widget _buildErrorMessage(BuildContext context, String errorMessage) {
    return SizedBox(
      height: 300.h,
      child: Center(
        child: Text(
          errorMessage,
          style: context.textTheme.labelLarge,
        ),
      ),
    );
  }
}
