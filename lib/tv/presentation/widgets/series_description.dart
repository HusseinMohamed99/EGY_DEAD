part of '../../../core/helpers/export_manager/export_manager.dart';

class SeriesDescription extends StatelessWidget {
  const SeriesDescription({
    super.key,
    required this.state,
  });

  final TvsDetailsStates state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SeriesInfoRow(state: state),
        if (state.tvsDetails?.genres != null &&
            state.tvsDetails?.overview != '')
          Column(
            children: [
              const Space(height: 16, width: 0),
              CinemaOverviewAndGenres(
                overview: state.tvsDetails?.overview ?? '',
                genres: state.tvsDetails?.genres ??
                    [
                      const Genres(id: 0, name: ''),
                    ],
              ),
            ],
          ),
      ],
    );
  }
}
