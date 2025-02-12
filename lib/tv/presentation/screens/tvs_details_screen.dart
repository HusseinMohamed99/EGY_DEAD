part of '../../../core/helpers/export_manager/export_manager.dart';

class TvsDetailsScreen extends StatelessWidget {
  const TvsDetailsScreen({super.key, required this.tvsID});
  final int tvsID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return sl<TvsDetailsBloc>()
          ..add(GetTvsDetailsEvent(tvsID))
          ..add(GetTvsRecommendationEvent(tvsID))
          ..add(GetTvsSimilarEvent(tvsID));
      },
      child: const Scaffold(
        body: TvsDetailsContent(),
      ),
    );
  }
}
