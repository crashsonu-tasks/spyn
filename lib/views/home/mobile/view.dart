// All Flutter Built-in Imports Here.
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

// All Native Imports Here.
import 'package:spyn/constants/texts.dart';
import 'package:spyn/views/home/bloc/cubits.dart';
import 'package:spyn/views/home/bloc/states.dart';
import 'package:spyn/views/home/widgets/common/appbar.dart';
import 'package:spyn/views/home/widgets/common/classes_basic_details.dart';

// All Attributes or Constants Here.

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
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
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/spyn.jpeg'),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                  text: homeCubit.appData['venue_basic_data']
                                      ['title'],
                                  textSize: 18,
                                  fontWeight: FontWeight.bold),
                              Html(
                                data: homeCubit.appData['venue_basic_data']
                                    ['description'],
                                style: {
                                  "*": Style(
                                    fontSize: FontSize.medium,
                                    color: Colors.black,
                                  ),
                                  "a": Style(
                                    color: Colors.indigoAccent,
                                    textDecoration: TextDecoration.underline,
                                  ),
                                },
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: AppText(
                            text: 'Classes',
                            textSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: homeCubit.trialClasses.take(2).map((element) {
                          return ClassesBasicDetailsWidget(details: element);
                        }).toList(),
                      )
                    ],
                  ),
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
