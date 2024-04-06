// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

// All Native Imports Here.
import 'package:spyn/views/home/bloc/cubits.dart';
import 'package:spyn/views/home/bloc/states.dart';
import 'package:spyn/views/home/widgets/common/appbar.dart';

// All Attributes or Constants Here.

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoadedState) {
          return Container(
            child: Column(
              children: [
                Image.asset('assets/spyn.jpeg'),
                Html(
                  data: homeCubit.appData['venue_basic_data']['description'],
                  style: {
                    "*": Style(
                      fontSize: FontSize.medium,
                      color: Colors.black,
                    ),
                    "a": Style(
                      color: Colors.blue,
                      textDecoration: TextDecoration.underline,
                    ),
                  },
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
