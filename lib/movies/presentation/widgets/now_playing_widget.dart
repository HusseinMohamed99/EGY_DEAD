part of './../../../core/helpers/export_manager/export_manager.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        if (state.nowPlayingState == RequestState.loaded) {
          return BuildCarousel(movies: state.nowPlayingMovies);
        } else {
          return BuildSkeletonCarousel();
        }
      },
    );
  }
}
