part of '../helpers/export_manager/export_manager.dart';

class CinemaBackdropWidget extends StatelessWidget {
  const CinemaBackdropWidget({
    super.key,
    required this.backdropPath,
  });

  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return CachedImage(
      imageUrl: ApiConstance.imageURL(backdropPath),
      width: double.infinity,
      height: context.height * 0.2,
      boxFit: BoxFit.fitHeight,
    );
  }
}
