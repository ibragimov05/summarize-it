import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:summarize_it/core/utils/app_settings.dart';
import 'package:summarize_it/core/utils/utils.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  static Route<void> route() =>
      CupertinoPageRoute(builder: (context) => const PinCodeScreen());

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final LocalAuthentication _auth = LocalAuthentication();
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  Future<void> _authenticate() async {
    bool canCheckBiometrics = await _auth.canCheckBiometrics;
    bool didAuthenticate = false;

    if (canCheckBiometrics) {
      try {
        didAuthenticate = await _auth.authenticate(
          localizedReason: 'Please authenticate to access the app',
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
      } catch (e) {
      }
    }

    if (!didAuthenticate) {

    } else {
      if (!mounted) return;
      Navigator.pushNamed(context, AppRouter.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.amber),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your pin code'),
      ),
      body: Center(
        child: Pinput(
          controller: _pinCodeController,
          defaultPinTheme: defaultPinTheme,
          onChanged: (value) {
            if (value.trim().isNotEmpty &&
                int.tryParse(value) != null &&
                int.parse(value) == AppSettings.userPassword) {
              Navigator.pushReplacementNamed(context, AppRouter.main);
            }
          },
        ),
      ),
    );
  }
}