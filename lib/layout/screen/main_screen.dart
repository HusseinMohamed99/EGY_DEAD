import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movies_app/core/ads_manager/ad_manager.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    try {
      AdManager.loadAdBanner(() {
        setState(() {});
      });
    } catch (e) {
      log('Error loading banner ad: $e');
    }
  }

  @override
  void dispose() {
    AdManager.disposeAdBanner();
    AdManager.disposeInterstitialAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Container(
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: state.currentIndex,
                onTap: (index) {
                  context.read<MainBloc>().add(ChangeCurrentIndexEvent(index));
                },
                showSelectedLabels: true,
                showUnselectedLabels: false,
                items: [
                  bottomNavigationBarItem(icon: Icons.movie, label: 'Movies'),
                  bottomNavigationBarItem(icon: Icons.tv, label: 'Tvs'),
                  bottomNavigationBarItem(icon: Icons.search, label: 'Search'),
                  bottomNavigationBarItem(
                      icon: Icons.settings, label: 'Settings'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(child: state.screens[state.currentIndex]),
                Visibility(
                  visible: AdManager.bannerAd != null,
                  child: SizedBox(
                    height: AdManager.bannerAd!.size.height.toDouble(),
                    width: AdManager.bannerAd!.size.width.toDouble(),
                    child: AdWidget(ad: AdManager.bannerAd!),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      backgroundColor: ColorManager.charCoolColor,
    );
  }
}
