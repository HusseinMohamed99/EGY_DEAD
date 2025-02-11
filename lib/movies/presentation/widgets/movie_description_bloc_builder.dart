part of './../../../core/helpers/export_manager/export_manager.dart';

class MovieDescriptionBLocBuilder extends StatelessWidget {
  const MovieDescriptionBLocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsStates>(
      builder: (context, state) {
        if (state.moviesDetailsStates == RequestState.loading) {
          return MovieDetailsDisplay(moviesDetailsStates: state).skeletonize();
        } else if (state.moviesDetailsStates == RequestState.loaded) {
          return MovieDetailsDisplay(moviesDetailsStates: state);
        } else {
          return BuildErrorMessage(errorMessage: state.moviesDetailsMessage);
        }
      },
    );
  }
}
