import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/now_playing_widget.dart';
import 'package:movies_app/movies/presentation/widgets/popular_movies_widget.dart';
import 'package:movies_app/movies/presentation/widgets/top_rated_movies_widget.dart';
import 'package:movies_app/movies/presentation/widgets/upcoming_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              NowPlayingWidget(),
              UpcomingWidget(),
              PopularMoviesWidget(),
              TopRatedMoviesWidget(),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
