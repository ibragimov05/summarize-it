part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});
}

final class RegisterUserEvent extends AuthEvent {
  final String firstName;
  final String secondName;
  final String email;
  final String password;

  RegisterUserEvent({
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.password,
  });
}

final class WatchAuthEvent extends AuthEvent {}

final class LogoutEvent extends AuthEvent {}
