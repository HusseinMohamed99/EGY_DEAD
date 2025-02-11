part of '../helpers/export_manager/export_manager.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    required this.cast,
    super.key,
  });
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8).r,
            child: CachedImage(
              imageUrl: cast.profileUrl,
              width: double.infinity,
              height: 70.h,
              boxFit: BoxFit.fitWidth,
            ),
          ),
          const Space(height: 8, width: 0),
          Text(
            cast.name,
            style: TextStyleManager.labelSmall(context: context),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
