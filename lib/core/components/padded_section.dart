part of './../helpers/export_manager/export_manager.dart';

class PaddedSection extends StatelessWidget {
  final Widget child;
  const PaddedSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: child,
    );
  }
}
