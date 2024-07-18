import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginPressed>(_loginPressed);
  }

  FutureOr<void> _loginPressed(LoginPressed event, Emitter<LoginState> emit) {
    print(event.username);
    print(event.password);
    emit(LoginLoading());
    if (event.username == "admin" && event.password == "12345") {
      emit(LoginSuccess());
    } else {
      emit(LoginError("Invalid Credentials"));
    }
  }
}
