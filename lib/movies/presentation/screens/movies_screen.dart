import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/widgets/now_playing_widget.dart';
import 'package:movies_app/movies/presentation/widgets/popular_movies_widget.dart';
import 'package:movies_app/movies/presentation/widgets/top_rated_movies_widget.dart';
import 'package:movies_app/movies/presentation/widgets/upcoming_widget.dart';

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
