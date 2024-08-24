class UserModel {
  final String id;
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;

  const UserModel({
    required this.id,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        uid: json['uid'],
        firstName: json['first-name'],
        lastName: json['last-name'],
        email: json['email'],
        photoUrl: json['photo-url'] ?? 'null',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'uid': uid,
        'first-name': firstName,
        'last-name': lastName,
        'email': email,
        'photo-url': photoUrl,
      };

  @override
  String toString() {
    return 'UserModel(id: $id, uid: $uid, firstName: $firstName, lastName: $lastName, email: $email, photoUrl: $photoUrl)';
  }
}
