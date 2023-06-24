import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/global/app_string/app_string.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/presentation_main_app/screen/main_screen.dart';

void main() async {
  ScreenUtil.ensureScreenSize();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppString.appTitle,
              theme: ThemeData.dark()
                  .copyWith(scaffoldBackgroundColor: Colors.black),
              home: const MainScreen(),
            );
          },
        );
      },
    );
  }
}
