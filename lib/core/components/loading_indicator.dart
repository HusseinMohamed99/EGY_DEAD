part of './../helpers/export_manager/export_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.amber,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.blueAccent,
        ),
        strokeWidth: 5,
      ),
    );
  }
}
