import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/logic/blocs/monitor_connection/monitor_connection_bloc.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MonitorConnectionBloc, MonitorConnectionState>(
      listener: (context, state) {
        if (state is ConnectivityConnected) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(

      ),
    );
  }
}
