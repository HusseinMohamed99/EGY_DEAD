part of './../../../core/helpers/export_manager/export_manager.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedMoviesEvent())
          ..add(GetUpcomingMoviesEvent());
      },
      child: Scaffold(
        body:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          const SliverToBoxAdapter(child: NowPlayingWidget()),
          const SliverToBoxAdapter(child: UpcomingWidget()),
          const SliverToBoxAdapter(child: PopularMoviesWidget()),
          const SliverToBoxAdapter(child: TopRatedMoviesWidget()),
          SliverToBoxAdapter(child: Space(height: 10, width: 0)),
        ]),
      ),
    );
  }
}
