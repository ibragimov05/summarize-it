class UserModel {
  final String id;
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final int chatProfileColor;

  const UserModel({
    required this.id,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.chatProfileColor,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? '',
        uid: json['uid'] ?? '',
        firstName: json['first-name'] ?? '',
        lastName: json['last-name'] ?? '',
        email: json['email'] ?? '',
        chatProfileColor: json['user-chat-color'] ?? 4292576568,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'uid': uid,
        'first-name': firstName,
        'last-name': lastName,
        'email': email,
        'user-chat-color': chatProfileColor,
      };

  @override
  String toString() {
    return 'UserModel(id: $id, uid: $uid, firstName: $firstName, lastName: $lastName, email: $email, user-chat-color: $chatProfileColor)';
  }
}
