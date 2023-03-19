import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/utils/cubit/cubit.dart';
import '../../../../core/utils/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double circleSize = 200.0;
    return Scaffold(
      body: Center(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedContainer(
                    curve: Curves.fastLinearToSlowEaseIn,
                    color: Colors.transparent,
                    width: AppBloc.get(context).repeats == 0 ? 0 : 200.0,
                    height: AppBloc.get(context).repeats == 0 ? 0 : 200.0,
                    duration: const Duration(seconds: 2),
                    child: Center(
                      child: Text(
                        '${AppBloc.get(context).repeats} تكرارات ',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    )),
                CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 10.0,
                  animateFromLastPercent: true,
                  percent: AppBloc.get(context).percent,
                  center: Material(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(circleSize),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.green,
                      borderRadius: BorderRadius.circular(circleSize),
                      onTap: () {
                        AppBloc.get(context).changePercent();
                      },
                      child: SizedBox(
                        height: circleSize,
                        width: circleSize,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '${AppBloc.get(context).count}',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              Text(
                                'سبحان الله',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppBloc.get(context).reset();
        },
        child: const Icon(Icons.restart_alt_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods
    );
  }
}
