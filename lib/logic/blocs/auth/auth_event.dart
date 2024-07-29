part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class InitialAuthEvent extends AuthEvent {}

final class LoginUserEvent extends AuthEvent {}

final class RegisterUserEvent extends AuthEvent {}

final class ToggleAuthEvent extends AuthEvent {}

final class WatchAuthEvent extends AuthEvent {}

final class LogoutEvent extends AuthEvent {}
