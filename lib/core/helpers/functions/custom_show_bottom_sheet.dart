part of './../export_manager/export_manager.dart';

void showCustomBottomSheet(BuildContext context, Widget child) {
  final size = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    backgroundColor: ColorManager.charCoolColor,
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: size * 0.7,
        child: child,
      );
    },
  );
}
