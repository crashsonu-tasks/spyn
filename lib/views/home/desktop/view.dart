// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.

// All Native Imports Here.
import 'package:spyn/views/home/widgets/common/appbar.dart';

// All Attributes or Constants Here.

class DesktopHomeView extends StatelessWidget {

  const DesktopHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {

  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
