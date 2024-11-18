part of './../../../core/helpers/export_manager/export_manager.dart';

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({
    super.key,
    required this.trailerUrl,
  });

  final String trailerUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 19.r,
      backgroundColor: ColorManager.primaryRedColor,
      child: IconButton(
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
      ),
    );
  }
}
