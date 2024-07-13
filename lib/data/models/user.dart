class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final List<String> favoriteBooks;
  final List<String> history;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.favoriteBooks,
    required this.history,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        firstName: json['first-name'],
        lastName: json['last-name'],
        email: json['email'],
        favoriteBooks: json['favorite-books'],
        history: json['history'],
      );
}
