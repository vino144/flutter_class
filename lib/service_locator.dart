import 'package:first_project/screens/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.asNewInstance();

Future<void> initServiceLocator() async {
  serviceLocator.registerFactory<LoginBloc>(() => LoginBloc());
}
