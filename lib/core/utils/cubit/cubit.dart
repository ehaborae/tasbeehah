import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/cubit/states.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of(context);

  double percent = 0.0;
  int count = 0;
  int maxCount = 5;
  int repeats = 0;

  void changePercent() {
    print('percent: $percent');
    print('count: $count');

    if (count == maxCount) {
      percent = 0.0;
      count = 0;
      repeats += 1;
      percent += 1 / maxCount;
      count = (percent * maxCount).round();
      emit(ChangePercentState());
      return;
    }
    //30% is the maximum
    percent += 1 / maxCount;
    count = (percent * maxCount).round();
    emit(ChangePercentState());

    print('percent: $percent');
    print('count: $count');
  }

  void reset() {
    percent = 0.0;
    count = 0;
    repeats = 0;
    emit(ResetState());
  }
}
