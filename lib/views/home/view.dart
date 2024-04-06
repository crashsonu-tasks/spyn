// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:spyn/utils/responsive.dart';
import 'package:spyn/views/home/mobile/view.dart';
import 'package:spyn/views/home/desktop/view.dart';

// All Attributes or Constants Here.

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: MobileHomeView(),
        landscape: MobileHomeView(),
      ),
      desktop: OrientationLayout(
        portrait: DesktopHomeView(),
        landscape: DesktopHomeView(),
      ),
      tablet: OrientationLayout(
        portrait: MobileHomeView(),
        landscape: MobileHomeView(),
      ),
    );
  }
}
