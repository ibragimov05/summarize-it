part of 'user_info_bloc.dart';

final class UserInfoState {
  final String? id;
  final String? uid;
  String? firstName;
  String? lastName;
  final String? email;
  String? errorMessage;
  bool isLoading;

  UserInfoState({
    this.id,
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.errorMessage,
    this.isLoading = false,
  });

  UserInfoState copyWith({
    String? id,
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    String? errorMessage,
    bool? isLoading,
  }) {
    return UserInfoState(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return """
$id,
$uid,
$firstName,
$lastName,
$email,
$errorMessage + '--------------------------------------------------',
$isLoading,
""";
  }
}
