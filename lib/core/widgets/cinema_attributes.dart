part of '../helpers/export_manager/export_manager.dart';

class CinemaAttributes extends StatelessWidget {
  const CinemaAttributes({
    super.key,
    required this.releaseDate,
    required this.rate,
    required this.duration,
  });

  final String? releaseDate, rate;
  final int? duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CinemaReleaseDate(
            releaseDate: releaseDate ?? '',
          ),
        ),
        const Space(height: 0, width: 8),
        Expanded(
          child: CinemaRating(
            rate: rate ?? '',
          ),
        ),
        const Space(height: 0, width: 8),
        Expanded(
          child: CinemaDuration(
            duration: duration ?? 0,
          ),
        ),
      ],
    );
  }
}
