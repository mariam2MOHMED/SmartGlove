import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class LoadingIndictor extends StatelessWidget {
  const LoadingIndictor({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Center(
      child: LoadingAnimationWidget.
      staggeredDotsWave(color:
      settingProvider.themeMode==ThemeMode.dark?AppTheme.darksecondary:AppTheme.primary,
          size: 40.0),
    );
  }
}
