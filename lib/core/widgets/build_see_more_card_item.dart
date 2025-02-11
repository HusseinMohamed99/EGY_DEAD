part of './../helpers/export_manager/export_manager.dart';

class BuildSeeMoreCardItem extends StatelessWidget {
  const BuildSeeMoreCardItem(
      {super.key,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.imageUrl,
      required this.rating,
      required this.onTap});
  final String title, imageUrl, overview, releaseDate;
  final double rating;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildContainerDecoration(),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              decoration: buildContainerDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0).r,
                child: CachedImage(
                  boxFit: BoxFit.fill,
                  imageUrl: imageUrl,
                  width: 120.w,
                  height: 120.h,
                ),
              ),
            ),
            const Space(height: 0, width: 10),
            Expanded(
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyleManager.titleMedium(context: context),
                  ),
                  BuildReleaseDateChip(releaseDate: releaseDate),
                  BuildRating(rating: rating),
                  Text(
                    overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.labelSmall(context: context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
