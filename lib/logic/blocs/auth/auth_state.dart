part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

class AuthState {
  final formKey = GlobalKey<FormState>();
  bool isLogin;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? passwordConfirmController;
  TextEditingController? firstNameController;
  TextEditingController? secondNameController;
  AuthStatus? status;
  String? error;
  User? user;

  AuthState({
    this.isLogin = true,
    this.emailController,
    this.passwordController,
    this.passwordConfirmController,
    this.firstNameController,
    this.secondNameController,
    this.status,
    this.error,
    this.user,
  });

  AuthState copyWith({
    bool? isLogin,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? passwordConfirmController,
    TextEditingController? firstNameController,
    TextEditingController? secondNameController,
    AuthStatus? status,
    String? error,
    User? user,
  }) {
    return AuthState(
      isLogin: isLogin ?? this.isLogin,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      passwordConfirmController:
          passwordConfirmController ?? this.passwordConfirmController,
      firstNameController: firstNameController ?? this.firstNameController,
      secondNameController: secondNameController ?? this.secondNameController,
      status: status ?? this.status,
      error: error,
      user: user,
    );
  }
}
