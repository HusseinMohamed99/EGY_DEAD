import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  // Initialize all services including BlocProviders
  await serviceLocator();
  // if (kReleaseMode) {
  //   try {
  //     await requestReview();
  //   } catch (e) {
  //     log('Error requesting review: $e');
  //   }
  // }
  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
  }
  runApp(
    EgyDeadApp(
      appRouter: AppRouters(),
    ),
  );
}



// Future<void> requestReview() async {
//   final InAppReview inAppReview = InAppReview.instance;

//   if (await inAppReview.isAvailable()) {
//     await inAppReview.requestReview();
//   } else {
//     goToApplicationOnPlayStore();
//   }
// }

// Future<void> goToApplicationOnPlayStore() async {
//   try {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     String packageName = packageInfo.packageName;
//     String url = 'https://play.google.com/store/apps/details?id=$packageName';

//     if (Platform.isAndroid &&
//         !await launchUrl(Uri.parse(url),
//             mode: LaunchMode.externalApplication)) {
//       throw Exception('Could not launch $url');
//     }
//   } catch (e) {
//     log('Error launching URL: $e');
//   }
// }
