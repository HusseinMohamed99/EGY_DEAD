part of './../../../core/helpers/export_manager/export_manager.dart';

class RecommendationLoadedItem extends StatelessWidget {
  const RecommendationLoadedItem({
    super.key,
    required this.iD,
    required this.backdropPath,
  });

  final int iD;
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TvsDetailsScreen(tvsID: iD),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(
            color: ColorManager.whiteColor,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)).r,
          child: CachedImage(
            imageUrl: ApiConstance.imageURL(backdropPath),
            width: 100.w,
            height: 100.h,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
