import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingIndictor extends StatelessWidget {
  const LoadingIndictor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.
      staggeredDotsWave(color: AppTheme.primary,
          size: 40.0),
    );
  }
}
