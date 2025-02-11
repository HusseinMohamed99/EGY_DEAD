part of './../helpers/export_manager/export_manager.dart';

class ContentDisplayCard extends StatelessWidget {
  const ContentDisplayCard({
    super.key,
    required this.navigateToDetailsSection,
    required this.imageUrl,
  });

  final VoidCallback navigateToDetailsSection;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToDetailsSection,
      child: Container(
        decoration: buildContainerDecoration(),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
          child: CachedImage(
            boxFit: BoxFit.fitHeight,
            imageUrl: imageUrl,
            width: 120.w,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
