part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = LoginUserEvent;

  const factory AuthEvent.register({
    required String firstName,
    required String secondName,
    required String email,
    required String password,
  }) = RegisterUserEvent;

  const factory AuthEvent.resetPassword({
    required String email,
  }) = ResetPasswordEvent;

  const factory AuthEvent.watch() = WatchAuthEvent;

  const factory AuthEvent.logout() = LogoutEvent;
}
