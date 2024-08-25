part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = InitialAuthState;
  const factory AuthState.loading() = LoadingAuthState;
  const factory AuthState.unauthenticated() = UnauthenticatedState;
  const factory AuthState.authenticated() = AuthenticatedState;
  const factory AuthState.error(String errorMessage) = ErrorAuthState;
}
