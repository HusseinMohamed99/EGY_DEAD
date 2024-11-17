part of './../../../core/helpers/export_manager/export_manager.dart';

class TvsScreen extends StatelessWidget {
  const TvsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: const OnTheAirWidget()),
        SliverToBoxAdapter(child: const AiringTodayWidget()),
        SliverToBoxAdapter(child: const PopularTvsWidget()),
        SliverToBoxAdapter(child: const TopRatedTvsWidget()),
        SliverToBoxAdapter(child: Space(height: 24, width: 0)),
      ],
    );
  }
}
