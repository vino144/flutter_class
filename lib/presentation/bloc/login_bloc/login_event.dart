part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginPressed extends LoginEvent {
  final String username;
  final String password;

  LoginPressed(this.username, this.password);
}
