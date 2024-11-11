part of './../../../core/helpers/export_manager/export_manager.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String message;
  final String? imagePath;
  final Color backgroundColor;
  final Color messageColor;
  final double fontSize;

  const NoDataFoundWidget({
    super.key,
    this.message = 'No data found.',
    this.imagePath,
    this.backgroundColor = ColorManager.darkPrimary,
    this.messageColor = ColorManager.whiteColor,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 150,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            const SizedBox(height: 16.0),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                color: messageColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
