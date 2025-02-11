part of './../../core/helpers/export_manager/export_manager.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.onTap,
    required this.title,
    this.icon,
    this.imageWidget,
  });
  final VoidCallback onTap;
  final String title;
  final IconData? icon;
  final Widget? imageWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
        color: ColorManager.charCoolColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15).r,
        ),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundColor: const Color.fromRGBO(105, 155, 247, 0.15),
                child: imageWidget ??
                    Icon(
                      icon,
                      size: 26.sp,
                      color: ColorManager.primaryGreenColor,
                    ),
              ),
              const Space(width: 35, height: 0),
              Text(
                title,
                style: TextStyleManager.titleMedium(context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
