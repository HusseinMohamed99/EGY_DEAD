import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_bloc.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_events.dart';
import 'package:movies_app/tvs/presentation/widgets/airing_today_widget.dart';
import 'package:movies_app/tvs/presentation/widgets/on_the_air_widget.dart';
import 'package:movies_app/tvs/presentation/widgets/popular_tvs_widget.dart';
import 'package:movies_app/tvs/presentation/widgets/top_rated_tvs_widget.dart';

class TvsScreen extends StatelessWidget {
  const TvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<TvsBloc>()
          ..add(GetOnTheAirTvsEvent())
          ..add(GetAiringTodayTvsEvent())
          ..add(GetPopularTvsEvent())
          ..add(GetTopRatedTvsEvent());
      },
      child: const Scaffold(
        body: SingleChildScrollView(
          key: Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnTheAirWidget(),
              AiringTodayWidget(),
              PopularTvsWidget(),
              TopRatedTvsWidget(),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
