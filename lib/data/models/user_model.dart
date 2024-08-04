import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String uid;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String lastName;
  @HiveField(4)
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

  @override
  String toString() {
    return """Id: $id,
uid: $uid,    
firstName: $firstName,
lastName: $lastName,
email: $email,
""";
  }
}
