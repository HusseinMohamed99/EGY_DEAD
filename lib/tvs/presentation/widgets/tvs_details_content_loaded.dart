part of './../../../core/helpers/export_manager/export_manager.dart';

class TvsDetailsContentLoaded extends StatelessWidget {
  const TvsDetailsContentLoaded({
    super.key,
    required this.state,
  });

  final TvsDetailsStates state;

  @override
  Widget build(BuildContext context) {
    final sections = [
      SeriesDescription(state: state),
      BuildTabBarSection(),
    ];
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SingleChildScrollView(
        key: const Key('tvDetailScrollView'),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CinemaBackdropWidget(
              backdropPath: state.tvsDetails?.backdropPath ?? '',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: sections
                  .map(
                    (section) => PaddedSection(child: section),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
