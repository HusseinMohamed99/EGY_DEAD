part of './../helpers/export_manager/export_manager.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.avatarUrl,
  });

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 20.r,
        backgroundColor: Colors.transparent,
        backgroundImage: imageProvider,
      ),
      errorWidget: (_, __, ___) => Image.asset(
        Assets.imagesAvatar,
        fit: BoxFit.fill,
      ),
    );
  }
}
