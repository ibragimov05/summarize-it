import 'package:flutter/material.dart';
import 'package:summarize_it/ui/widgets/animation_widget_with_bloc.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimationWidgetWithBloc(animationPath: 'assets/lottie/search.json'),
          Text(
            'Search screen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
