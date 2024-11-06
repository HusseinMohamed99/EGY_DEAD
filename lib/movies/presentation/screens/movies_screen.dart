part of './../../../core/helpers/export_manager/export_manager.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: NowPlayingWidget()),
        const SliverToBoxAdapter(child: PopularMoviesWidget()),
        const SliverToBoxAdapter(child: UpcomingMoviesWidget()),
        const SliverToBoxAdapter(child: TopRatedMoviesWidget()),
        SliverToBoxAdapter(child: Space(height: 24, width: 0)),
      ],
    );
  }
}
