part of './../../../core/helpers/export_manager/export_manager.dart';

class TvsScreen extends StatelessWidget {
  const TvsScreen({super.key});

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
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OnTheAirWidget(),
              const AiringTodayWidget(),
              const PopularTvsWidget(),
              const TopRatedTvsWidget(),
              Space(height: 10.h, width: 0),
            ],
          ),
        ),
      ),
    );
  }
}
