part of '../../../core/helpers/export_manager/export_manager.dart';

class TvsScreen extends StatelessWidget {
  const TvsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: OnTheAirWidget()),
        SliverToBoxAdapter(child: AiringTodayWidget()),
        SliverToBoxAdapter(child: PopularTvsWidget()),
        SliverToBoxAdapter(child: TopRatedTvsWidget()),
        SliverToBoxAdapter(child: Space(height: 24, width: 0)),
      ],
    );
  }
}
