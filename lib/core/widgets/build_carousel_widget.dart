part of './../helpers/export_manager/export_manager.dart';

class BuildCarouselWidget extends StatelessWidget {
  const BuildCarouselWidget({super.key, required this.items});
  final List<Widget> items;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: context.height * 0.3,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {},
      ),
      items: items,
    );
  }
}
