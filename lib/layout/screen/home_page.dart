import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laqta_app/core/helpers/app_string/app_string.dart';
import 'package:laqta_app/core/helpers/enum/enum.dart';
import 'package:laqta_app/core/helpers/export_manager/export_manager.dart';
import 'package:laqta_app/image_assets.dart';
import 'package:laqta_app/layout/screen/main_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkForUpdate(context, mounted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.lost) {
                context.showSnackBar(
                  AppString.checkInternetConnection,
                  color: ColorManager.primaryRedColor,
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.gained) {
                // Navigate to MainScreen once connected
                return BlocProvider(
                  create: (context) => sl<MainBloc>(),
                  child: const MainScreen(),
                ); // Temporary loading indicator while navigating
              } else if (state == InternetState.lost) {
                return SvgPicture.asset(Assets.imagesError);
              } else {
                return const CircularProgressIndicator.adaptive(); // Loading indicator
              }
            },
          ),
        ),
      ),
    );
  }
}
