import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/global/app_string/app_string.dart';
import 'core/global/theme/theme_data/theme_data.dart';
import 'core/services/services_locator.dart';
import 'core/utils/enum.dart';
import 'presentation_main_app/screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();

  // Initialize all services including BlocProviders
  await ServiceLocator().init();
  runApp(const EgyDeadApp());
}

class EgyDeadApp extends StatelessWidget {
  const EgyDeadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appTitle,
        theme: getThemeData[AppTheme.darkTheme],
        darkTheme: getThemeData[AppTheme.darkTheme],
        home: const HomePage(),
      ),
    );
  }
}
