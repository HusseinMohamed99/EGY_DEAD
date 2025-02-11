part of '../helpers/export_manager/export_manager.dart';

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({
    super.key,
    required this.trailerUrl,
  });

  final String trailerUrl;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: ColorManager.primaryRedColor,
      ),
      onPressed: () {
        urlLauncher(
          Uri.parse(
            trailerUrl,
          ),
        );
      },
      icon: Icon(
        Icons.play_circle,
        color: ColorManager.whiteColor,
        size: 24.sp,
      ),
    );
  }
}
