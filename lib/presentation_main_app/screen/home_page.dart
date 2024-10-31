import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/helpers/enum/enum.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/image_assets.dart';
import 'package:movies_app/presentation_main_app/screen/main_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: BlocProvider(
          create: (context) => sl<InternetCubit>(),
          child: Center(
            child: BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state == InternetState.lost) {
                  context.showSnackBar(
                    'Check Internet Connection',
                    color: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                if (state == InternetState.gained) {
                  // Show your information when connected
                  return UpgradeWrapper(child: const MainScreen());
                } else if (state == InternetState.lost) {
                  return SvgPicture.asset(Assets.imagesError);
                } else {
                  return const CircularProgressIndicator
                      .adaptive(); // Loading indicator
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
