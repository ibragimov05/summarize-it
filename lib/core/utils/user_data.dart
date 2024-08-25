import 'package:summarize_it/data/models/models.dart';

class UserData {
  static String id = 'null';
  static String uid = 'null';
  static String firstName = 'null';
  static String lastName = 'null';
  static String email = 'null';
  static int chatColor = 4292576568;

  static void set(UserModel user) {
    id = user.id;
    uid = user.uid;
    firstName = user.firstName;
    lastName = user.lastName;
    email = user.email;
    chatColor = user.chatProfileColor;
  }

  static void toInitial() {
    id = 'null';
    uid = 'null';
    firstName = 'null';
    lastName = 'null';
    email = 'null';
    chatColor = 4292576568;
  }

}
