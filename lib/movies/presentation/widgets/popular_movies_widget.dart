part of './../../../core/helpers/export_manager/export_manager.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        if (state.popularState == RequestState.loaded) {
          return BuildContentPopularMovies(state: state);
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
