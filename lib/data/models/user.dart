class UserModel {
  final String id;
  final String uid;
  final String firstName;
  final String lastName;
  final String email;

  const UserModel({
    required this.id,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        uid: json['uid'],
        firstName: json['first-name'],
        lastName: json['last-name'],
        email: json['email'],
      );
}
