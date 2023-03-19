import 'package:get_it/get_it.dart';
import '/core/utils/cubit/cubit.dart';

final injector = GetIt.instance;

class Injector {
  static init() {
    // Bloc
    injector.registerSingleton(AppBloc());
  }
}
