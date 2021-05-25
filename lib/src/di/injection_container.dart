import 'package:get_it/get_it.dart';
import 'package:school_presentation_module/src/blocs/login/login_bloc.dart';

final inject = GetIt.instance;

Future<void> init() async {
  // Bloc
  inject.registerFactory(() => LoginBloc(inject()));
}
