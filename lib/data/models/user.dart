class User {
  final String id;
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final List<String> favoriteBooks;
  final List<String> history;

  const User({
    required this.id,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.favoriteBooks,
    required this.history,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        uid: json['uid'],
        firstName: json['first-name'],
        lastName: json['last-name'],
        email: json['email'],
        favoriteBooks: List<String>.from(json['favorite-books']),
        history: List<String>.from(json['history']),
      );
}
