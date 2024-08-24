part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUserEvent() = GetUserEvent;

  const factory UserEvent.addNewUser({
    required String uid,
    required String firstName,
    required String lastName,
    required String email,
  }) = AddNewUserEvent;

  const factory UserEvent.updateUserData({
    String? email,
    String? name,
    String? firstName,
    String? photoPath,
  }) = UpdateUserDataEvent;
}
