import 'package:movies_app/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_bloc.dart';
import 'package:movies_app/tvs/presentation/controller/tvs_events.dart';
import 'package:movies_app/tvs/presentation/widgets/airing_today_widget.dart';
import 'package:movies_app/tvs/presentation/widgets/on_the_air_widget.dart';

class TvsScreen extends StatelessWidget {
  const TvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<TvsBloc>()
          ..add(GetOnTheAirTvsEvent())
          ..add(GetAiringTodayTvsEvent());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              OnTheAirWidget(),
              AiringTodayWidget(),
              // PopularWidget(),
              // TopRatedWidget(),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
