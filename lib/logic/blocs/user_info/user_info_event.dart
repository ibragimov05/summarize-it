part of 'user_info_bloc.dart';

@immutable
sealed class UserInfoEvents {}

final class GetUserInfoEvent extends UserInfoEvents {}

final class AddUserInfoEvent extends UserInfoEvents {
  final String email;
  final String uid;

  AddUserInfoEvent({required this.email, required this.uid});
}

final class EditUserInfoEvent extends UserInfoEvents {
  final String newFirstName;
  final String newSecondName;

  EditUserInfoEvent({required this.newFirstName, required this.newSecondName});
}
