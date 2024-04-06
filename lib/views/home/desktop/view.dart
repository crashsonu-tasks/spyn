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

class DesktopHomeView extends StatelessWidget {
  const DesktopHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: const HomeAppBar(),
      body: const BodyWidget(),
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1, child: Image.asset('assets/spyn.jpeg')),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    text: homeCubit.appData['venue_basic_data']
                                        ['title'],
                                    textSize: 17,
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
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 15),
                        child: AppText(
                            text: 'Classes',
                            textSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: homeCubit.trialClasses.take(2).map((element) {
                          return Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(maxWidth: 450),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child:
                                  ClassesBasicDetailsWidget(details: element));
                        }).toList(),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
